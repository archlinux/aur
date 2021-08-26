# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=kcat-cli
pkgver=1.7.0
pkgrel=1
pkgdesc='A generic non-JVM producer and consumer for Apache Kafka, think of it as a netcat for Kafka'
url="https://github.com/edenhill/kcat"
license=('BSD')
arch=(x86_64)
depends=(avro-c glibc librdkafka yajl zlib)
provides=('kcat')
conflicts=('kcat')
replaces=('kafkacat')

source=("${pkgname%-cli}-${pkgver}.tar.gz::https://github.com/edenhill/${pkgname%-cli}/archive/${pkgver}.tar.gz")

sha256sums=('baaed3cb6f5ade6a01355edb8819365e263a325375bee50727e009810e49cb38')

build() {
  cd ${pkgname%-cli}-${pkgver}
  ./configure --prefix=/usr
  sed -i -e 's/#define KCAT_VERSION.*/#define KCAT_VERSION "'"${pkgver}"'"/g' config.h
  make
}

package() {
  cd ${pkgname%-cli}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
