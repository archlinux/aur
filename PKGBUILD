# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgname=nuspell
pkgver=2.3.0
pkgrel=1
pkgdesc='Free and open source C++ spell checking library'
arch=('x86_64')
url='https://nuspell.github.io/'
license=('LGPL3+')
depends=('boost-libs' 'icu')
makedepends=('boost' 'catch2' 'cmake' 'ruby-ronn')
source=("https://github.com/nuspell/nuspell/archive/v${pkgver}.tar.gz")
sha512sums=('93630dec951d1256c7b8505b5d67e625c161b082fefbada5497cea0246d3a0bdf4f0e3732693709da06697162a490676a3de99f6c142270736c9c6b47f24e29c')

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
