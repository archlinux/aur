# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libconfig-git
pkgver=1.8.1.r2.gd4af75f
pkgrel=1
pkgdesc="C/C++ library for processing configuration files"
arch=('i686' 'x86_64')
url="https://hyperrealm.github.io/libconfig/"
license=('LGPL-2.1-or-later')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'texinfo')
provides=("libconfig=$pkgver")
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
  cmake --build "_build"
}

check() {
  cd "libconfig"

  #cmake --build "_build" --target test
}

package() {
  cd "libconfig"

  DESTDIR="$pkgdir" cmake --install "_build"
}
