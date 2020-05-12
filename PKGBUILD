# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgname=nuspell
pkgver=3.1.1
pkgrel=1
pkgdesc='Fast and safe spellchecking C++ library'
arch=('x86_64')
url='https://nuspell.github.io/'
license=('LGPL3+')
depends=('boost' 'icu')
makedepends=('catch2' 'cmake' 'ruby-ronn')
source=("https://github.com/nuspell/nuspell/archive/v${pkgver}.tar.gz")
sha512sums=('239855051d9f49ba16913283090c4214a8f6a6cc290d359ab54014ff76fc297c131b67c6748bd1d4cdcec43c00dccc7f0c1bf8b07e06c9c648bff52ff193e096')

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
