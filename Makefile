PROJECT_ID=clients-210617
DOCKER_IMG=gcr.io/$(PROJECT_ID)/helloworld-python
REGION=us-central1

e:
	echo $(DOCKER_IMG)

deploy:
	gcloud builds submit --tag $(DOCKER_IMG)
	gcloud run deploy helloworld-python \
  --image $(DOCKER_IMG) \
  --platform managed \
  --region $(REGION) \
  --allow-unauthenticated \
    && gcloud container images delete $DOCKER_IMG