# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=kcat-cli
pkgver=1.7.1
pkgrel=3
pkgdesc='A generic non-JVM producer and consumer for Apache Kafka, think of it as a netcat for Kafka'
url="https://github.com/edenhill/kcat"
license=('BSD')
arch=(x86_64)
depends=(avro-c glibc librdkafka yajl which zlib)
provides=('kcat')
conflicts=('kcat' 'kafkacat')
replaces=('kafkacat')

source=("${pkgname%-cli}-${pkgver}.tar.gz::https://github.com/edenhill/${pkgname%-cli}/archive/${pkgver}.tar.gz")

sha256sums=('a2daa5a14c43522153241a1d8a7ba3a51aa2a76f53a957907e18c79beec4a3a3')

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
