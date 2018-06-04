# Maintainer: Pierre-Yves Ritschard <pyr at spootnik dot org>

pkgname=kafkacat-git
pkgver=r207.be0cfa6
pkgrel=1
pkgdesc='Apache Kafka command line producer and consumer'
url="https://github.com/edenhill/kafkacat"
license=('BSD')
source=(git+https://github.com/edenhill/kafkacat)
arch=(i686 x86_64 armv7h)
depends=(glibc zlib librdkafka-git yajl)
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
  ./configure --prefix=/usr
  make
}

package() {
  cd kafkacat
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
