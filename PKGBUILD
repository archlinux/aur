# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=logfire
pkgname=python-${_name}
pkgver=3.5.3
pkgrel=5
pkgdesc='The best Python observability tool!'
arch=('any')
url='https://github.com/pydantic/logfire'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('cb4863cde51a4784fcdf78ac178c2a6f739b1c6c6061bb8662edf7eed7b643ac')
depends=('python>=3.8' 'python-opentelemetry-sdk' 'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-instrumentation' 'python-rich' 'python-protobuf' 'python-typing_extensions' 'python-executing')
makedepends=('python-hatchling' 'python-setuptools')
checkdepends=(#'python-anyio'
#              'python-httpx'
#              'python-aiohttp'
#              'python-redis'
              'python-pymongo'
#              'python-fastapi'
#              'python-flask'
              'python-django'
#              'python-dirty-equals'
              'python-pytest'
              'python-pytest-django'
              'python-pytest-pretty'
#              'python-pydantic'
#              'python-requests'
#              'python-sqlalchemy'
#              'python-pandas'
#              'python-attrs'
#              'python-openai'
#              'python-opentelemetry-instrumentation-aiohttp-client'
              'python-opentelemetry-instrumentation-asgi'
#              'python-opentelemetry-instrumentation-wsgi'
#              'python-opentelemetry-instrumentation-fastapi'
              'python-opentelemetry-instrumentation-starlette'
              'python-opentelemetry-instrumentation-flask'
#              'python-opentelemetry-instrumentation-django'
              'python-opentelemetry-instrumentation-httpx'
              'python-opentelemetry-instrumentation-requests'
              'python-opentelemetry-instrumentation-sqlalchemy'
              'python-opentelemetry-instrumentation-system-metrics'
              'python-opentelemetry-instrumentation-asyncpg'
#              'python-opentelemetry-instrumentation-psycopg'
#              'python-opentelemetry-instrumentation-psycopg2'
              'python-opentelemetry-instrumentation-redis'
#              'python-opentelemetry-instrumentation-pymongo'
              'python-opentelemetry-instrumentation-celery'
#              'python-opentelemetry-instrumentation-mysql'
              'python-opentelemetry-instrumentation-sqlite3'
              'python-opentelemetry-instrumentation-aws-lambda'
#              'python-eval-type-backport'
              'python-requests-mock'
              'python-inline-snapshot'
              'python-structlog'
              'python-loguru'
#              'python-ruff'
#              'pyright'
#              'python-coverage'
              'python-psycopg-c'
#              'python-psycopg2-c'
              'python-asyncpg'
              'python-pymysql'
#              'python-cryptography'
#              'python-cloudpickle'
              'python-anthropic'
              'python-sqlmodel'
              'python-celery'
#              'python-testcontainers'
#              'python-mysql-connector'
#              'python-pyarrow'
#              'python-numpy'
#              'python-pytest-recording'
#              'python-vcrpy'
#              'uvicorn'
#              'python-logfire-api'
#              'python-aiosqlite'
#              'python-boto3'
#              'python-botocore'
#              'python-greenlet'
              'python-pytest-xdist')
optdepends=('python-opentelemetry-instrumentation-system-metrics: system-metrics'
            'python-opentelemetry-instrumentation-asgi: asgi'
            'python-opentelemetry-instrumentation-wsgi: wsgi'
            'python-opentelemetry-instrumentation-aiohttp-client: aiohttp'
            'python-opentelemetry-instrumentation-celery: celery'
            'python-opentelemetry-instrumentation-django: django'
            'python-opentelemetry-instrumentation-fastapi: fastapi'
            'python-opentelemetry-instrumentation-flask: flask'
            'python-opentelemetry-instrumentation-httpx: httpx'
            'python-opentelemetry-instrumentation-starlette: starlette'
            'python-opentelemetry-instrumentation-sqlalchemy: sqlalchemy'
            'python-opentelemetry-instrumentation-asyncpg: asyncpg'
            'python-opentelemetry-instrumentation-psycopg: psycopg'
            'python-opentelemetry-instrumentation-psycopg2: psycopg2'
            'python-opentelemetry-instrumentation-pymongo: pymongo'
            'python-opentelemetry-instrumentation-redis: redis'
            'python-opentelemetry-instrumentation-requests: requests'
            'python-opentelemetry-instrumentation-mysql: mysql'
            'python-opentelemetry-instrumentation-sqlite3: sqlite3'
            'python-opentelemetry-instrumentation-aws-lambda: aws-lambda')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
