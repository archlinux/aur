# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nuspell-git
pkgver=3.1.2.r13.g094b398
pkgrel=1
pkgdesc="Fast and safe spellchecking C++ library"
arch=('i686' 'x86_64')
url="https://nuspell.github.io/"
license=('GPL3' 'LGPL3')
depends=('glibc' 'boost-libs' 'icu')
makedepends=('git' 'cmake' 'boost' 'ruby-ronn')
provides=('nuspell')
conflicts=('nuspell')
source=("git+https://github.com/nuspell/nuspell.git")
sha256sums=('SKIP')


pkgver() {
  cd "nuspell"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "nuspell"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

check() {
  cd "nuspell"

  make -C "_build" test
}

package() {
  cd "nuspell"

  make -C "_build" DESTDIR="$pkgdir" install
}
