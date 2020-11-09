# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime
pkgver=4.4.6
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox=$pkgver" 'soci>=4.0.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('baf89da4fcb73945c9d8fa9a0c820ce44b6214d532ecae7e4cf28706de8c8c16')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_PREFIX_PATH="/usr" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC="NO" \
      -DENABLE_UNIT_TESTS=NO "../$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
