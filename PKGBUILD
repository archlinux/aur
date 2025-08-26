# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=testcontainers
pkgname=python-${_name}
pkgver=4.12.0
pkgrel=1
pkgdesc='Python library for throwaway instances of anything that can run in a Docker container.'
arch=('any')
url='https://github.com/testcontainers/testcontainers-python'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name//-/_}-v${pkgver}.tar.gz")
sha256sums=('3ae97315217e83275467fd217b13327fcef22ea96f76230dba53560634ef9ed4')
depends=('python>=3.9' 'python-docker' 'python-urllib3' 'python-wrapt' 'python-typing_extensions' 'python-dotenv')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-anyio' 'python-psycopg2' 'python-pg8000' 'python-sqlalchemy' 'python-psycopg' 'python-cassandra-driver' 'python-pytest-asyncio' 'python-kafka-ng' 'python-hvac' 'python-pymilvus' 'python-httpx' 'python-paho-mqtt' 'python-sqlalchemy-cockroachdb' 'python-paramiko' 'python-types-paramiko' 'python-pytest-mock' )
optdepends=('python-arango: arangodb'
            'python-botto3: aws - localstack'
            'python-httpx: aws - generic - test_module_import'
            'python-azure-storage-blob: azurite'
            'python-clickhouse-driver: clickhouse'
            'python-azure-cosmos: cosmosdb'
            'python-sqlalchemy: db2 - mssql - mysql - oracle - oracle-free'
            'python-ibm-db-sa: db2'
            'python-redis: generic - redis'
            'python-google-cloud-pubsub: google'
            'python-google-cloud-datastore: google'
            'python-influxdb: influxdb'
            'python-influxdb-client: influxdb'
            'python-kubernetes: k3s'
            'python-pyyaml: k3s'
            'python-keycloak: keycloak'
            'python-cryptography: mailpit - sftp'
            'python-minio: minio'
            'python-pymongo: mongodb'
            'python-pymssql: mssql'
            'python-pymysql: mysql'
            'python-nats: nats'
            'python-neo4j: neo4j'
            'python-opensearch: opensearch'
            'python-oracledb: oracle - oracle-free'
            'python-qdrant-client: qdrant'
            'python-pika: pika'
            'python-bcrypt: registry'
            'python-selenium: selenium'
            'python-cassandra-driver: scylla'
            'python-weaviate-client: weaviate'
            'python-chromadb-client: chroma'
            'python-trino: trino')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check(){
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name//-/_}-${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" core/tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
