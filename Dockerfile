FROM eclipse-temurin:21-alpine AS build_image
COPY . /app
WORKDIR /app
RUN ./gradlew build --no-daemon

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build_image /app/build/libs/*SNAPSHOT.jar /app/app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
