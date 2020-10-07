# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cmocka-git
pkgver=1.1.5.r39.g314602b
pkgrel=1
pkgdesc="An unit testing framework for C with support for mock objects"
arch=('i686' 'x86_64')
url="https://cmocka.org/"
license=('apache')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('cmocka')
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
  make -C "_build"
}

check() {
  cd "cmocka"

  make -C "_build" test
}

package() {
  cd "cmocka"

  make -C "_build" DESTDIR="$pkgdir" install
}
