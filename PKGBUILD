# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgname=nuspell
pkgver=3.0.0
pkgrel=1
pkgdesc='Free and open source C++ spell checking library'
arch=('x86_64')
url='https://nuspell.github.io/'
license=('LGPL3+')
depends=('boost-libs' 'icu')
makedepends=('boost' 'catch2' 'cmake' 'ruby-ronn')
source=("https://github.com/nuspell/nuspell/archive/v${pkgver}.tar.gz")
sha512sums=('d9cd7dd276e2bca43dec3abaf11c5206695949b9fda8c9b86f2772cc7e8fa95bf17c685a2ef9ca87fe3c4f0b55f2fcb435bc21c187355f5e3fa35dcafab2c8c2')

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=ON
  make
}

check() {
  cd "$pkgname-$pkgver/build"
  make test
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
