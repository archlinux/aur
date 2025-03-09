# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-confluent-kafka
pkgver=2.8.2
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
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-sphinx'
    'python-sphinx_rtd_theme'
    'tar'
)
changelog="CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/confluentinc/confluent-kafka-python/tarball/refs/tags/v$pkgver")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('e79d58ae68ca40afa766d779309ac495e0f82bda58fc911ed0fd7015c2df737e4eec0d7d30f5c1b5aa449253822b5349a4917839e21e90201937569685a99859')

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
    install -Dm644 "docs/build/confluent-kafka.1" -t "$pkgdir/usr/share/man/man1/python-confluent-kafka.1"
}
