# Maintainer: Chris Coggburn <noderat at gmail dot com>

pkgname=kafkacat-avro-git
pkgver=r257.e982568
pkgrel=1
pkgdesc='Apache Kafka command line producer and consumer with Avro support'
url="https://github.com/edenhill/kafkacat"
license=('BSD')
source=(git+https://github.com/edenhill/kafkacat)
arch=(i686 x86_64 armv7h)
provides=(kafkacat)
conflicts=(kafkacat kafkacat-git)
depends=(glibc zlib librdkafka libserdes avro-c yajl-edenhill)
makedepends=(git)
sha256sums=('SKIP')

pkgver() {
  cd kafkacat
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd kafkacat
  # Use this line to compile with debugging symbols
  # ./configure --prefix=/usr --debug
  ./configure --prefix=/usr --enable-json --enable-avro
  make
}

package() {
  cd kafkacat
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
