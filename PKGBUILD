# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-confluent-kafka
pkgver=2.13.2
pkgrel=1
pkgdesc="Confluent's Python client for Apache Kafka"
arch=(x86_64)
url="https://github.com/confluentinc/confluent-kafka-python"
license=('Apache-2.0')
depends=(
    'python'
    'librdkafka'
    'glibc'
    'python-requests'
    'python-protobuf'
    'python-urllib3'
    'python-fastavro'
    'python-avro'
    'python-jsonschema'
    'python-protobuf'
    'python-boto3'
    'python-google-auth'
    'python-hkdf'
    'python-hvac'
    'python-attrs'
    'python-cachetools'
    'python-httpx'
    'python-authlib'
    'python-certifi'
    'python-googleapis-common-protos'
    'python-botocore'
    'python-orjson'
    'python-referencing'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-sphinx'
    'python-sphinx_rtd_theme'
    'git'
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('4b75598e5802e79b5fe97206db60eafeccd83f3e51966006cb50f9e5592e10983fde917700b5955d87f90c9bc5ee097128198bb151798ee5181c6b55121c661a')

build(){
    cd "$pkgname"
    python -m build --wheel --no-isolation
    sphinx-build docs docs/build --builder man --quiet
}

package(){
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 "docs/build/confluent-kafka.1" "$pkgdir/usr/share/man/man1/python-confluent-kafka.1"
}
