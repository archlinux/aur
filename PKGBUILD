# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-confluent-kafka
pkgver=2.10.0
pkgrel=2
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
    'python-google-api-core'
    'python-hkdf'
    'python-hvac'
    'python-pyyaml'
    'python-attrs'
    'python-cachetools'
    'python-httpx'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-sphinx'
    'python-sphinx_rtd_theme'
    'python-authlib'
    'tar'
)
changelog="CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/confluentinc/confluent-kafka-python/tarball/refs/tags/v$pkgver")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('a8ecaacaf6aeca70153fd1f847832c436b7eaecc67bd8075190419d70d5b16bf3999562cddd4df3769ac4c2c82b336b4199fd02164282ce5fe23d3217a7c8e4c')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
    sphinx-build docs docs/build --builder man --quiet
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 "docs/build/confluent-kafka.1" "$pkgdir/usr/share/man/man1/python-confluent-kafka.1"
}
