# Maintainer: Alim Gokkaya <alimgokkaya@gmail.com>
# Contributor: Seth Girvan <snth@snthhacks.com>

pkgname=librdkafka-git
pkgver=1.2.2.RC1.r0.gda83c934
pkgrel=1
pkgdesc='Apache Kafka C driver library'
url="https://github.com/edenhill/librdkafka"
license=('BSD')
source=(git+https://github.com/edenhill/librdkafka)
arch=(i686 x86_64 armv7h)
provides=(librdkafka)
conflicts=(librdkafka)
depends=(glibc zlib)
optdepends=(openssl libsasl lz4)
makedepends=(git python)
sha256sums=('SKIP')

pkgver() {
  cd librdkafka
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
