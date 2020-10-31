# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Andy Fang <andy+aur at andyfang dot me>

pkgname=kafkacat
pkgver=1.6.0
pkgrel=1
pkgdesc='Generic command line non-JVM Apache Kafka producer and consumer'
url="https://github.com/edenhill/kafkacat"
license=('BSD')
arch=(x86_64)
depends=(glibc zlib librdkafka yajl avro-c)
makedepends=()
provides=('kafkacat')
conflicts=('kafkacat')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/edenhill/kafkacat/archive/${pkgver}.tar.gz")

sha256sums=('e67aecd153659d7ea0d561469a1e65038485fe9a3203fa8c9c59a9fe02164bf0')

build() {
  cd kafkacat-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd kafkacat-${pkgver}
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
