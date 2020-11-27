# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libconfig-git
pkgver=1.7.2.r54.g6304782
pkgrel=1
pkgdesc="C/C++ library for processing configuration files"
arch=('i686' 'x86_64')
url="https://hyperrealm.github.io/libconfig/"
license=('LGPL')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'texinfo')
provides=('libconfig')
conflicts=('libconfig')
source=("git+https://github.com/hyperrealm/libconfig.git")
sha256sums=('SKIP')


pkgver() {
  cd "libconfig"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libconfig"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "libconfig"

  make -C "_build" test
}

package() {
  cd "libconfig"

  make -C "_build" DESTDIR="$pkgdir" install
}
