# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-confluent-kafka
pkgver=2.12.2
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
    'python-google-api-core'
    'python-hkdf'
    'python-hvac'
    'python-pyyaml'
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
    'python-authlib'
    'tar'
)
changelog="CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/confluentinc/confluent-kafka-python/tarball/refs/tags/v$pkgver")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('992fffb41c0cd42ee59f0a0692a8aa9ddc4fa4de9c649bc0834c3bf0f61a1c3be16a46c96ff36d947613b1f3b1037f8ba4be9e5fd08f5f8889e898654ee125c7')

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
