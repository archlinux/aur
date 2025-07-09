# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cmocka-git
pkgver=1.1.5.r277.g5912a32
pkgrel=1
pkgdesc="An unit testing framework for C with support for mock objects"
arch=('i686' 'x86_64')
url="https://cmocka.org/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("cmocka=$pkgver")
conflicts=('cmocka')
options=('staticlibs')
source=("git+https://git.cryptomilk.org/projects/cmocka.git")
sha256sums=('SKIP')


pkgver() {
  cd "cmocka"

  git describe --long --tags | sed 's/^cmocka-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cmocka"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUNIT_TESTING=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "cmocka"

  #cmake --build "_build" --target test
}

package() {
  cd "cmocka"

  DESTDIR="$pkgdir" cmake --install "_build"
}
