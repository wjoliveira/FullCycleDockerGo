FROM golang:1.4.3-alpine AS builder

WORKDIR /app

COPY fullcycle.go /app

RUN go build fullcycle.go

FROM scratch
WORKDIR /app
COPY --from=builder /app /app

ENTRYPOINT [ "./fullcycle" ]


