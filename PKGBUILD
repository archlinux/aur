# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nuspell-git
pkgver=5.1.6.r1.g6e46eb3
pkgrel=1
pkgdesc="Fast and safe spellchecking C++ library"
arch=('i686' 'x86_64')
url="https://nuspell.github.io/"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=('glibc' 'boost-libs' 'icu')
makedepends=('git' 'cmake' 'boost' 'ruby-ronn')
provides=("nuspell=$pkgver")
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
  cmake --build "_build"
}

check() {
  cd "nuspell"

  #cmake --build "_build" --target test
}

package() {
  cd "nuspell"

  DESTDIR="$pkgdir" cmake --install "_build"
}
