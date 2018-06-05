# Maintainer: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka-git
pkgver=r2605.d0f001df
pkgrel=1
pkgdesc='Apache Kafka C driver library'
url="https://github.com/edenhill/librdkafka"
license=('BSD')
source=(git+https://github.com/edenhill/librdkafka)
arch=(i686 x86_64 armv7h)
depends=(glibc zlib)
optdepends=(openssl libsasl lz4)
makedepends=(git python)
sha256sums=('SKIP')

pkgver() {
  cd librdkafka
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd librdkafka
  # Use this line to compile with debugging symbols
  # ./configure --prefix=/usr --debug
  ./configure --prefix=/usr
  make
}

package() {
  cd librdkafka
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
