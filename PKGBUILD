# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgname=nuspell
pkgver=3.1.0
pkgrel=1
pkgdesc='Free and open source C++ spell checking library'
arch=('x86_64')
url='https://nuspell.github.io/'
license=('LGPL3+')
depends=('boost' 'icu')
makedepends=('catch2' 'cmake' 'ruby-ronn')
source=("https://github.com/nuspell/nuspell/archive/v${pkgver}.tar.gz")
sha512sums=('a9bedfd6e2d77fd34d249cf7aa1fcb6bde5bced26f02f8a2dd860416a61488c9b7016a0df6015052fcccb272b342e6205db601107f46efa44c9d78ce261a826c')

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
