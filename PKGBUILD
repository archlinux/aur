# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cmocka-git
pkgver=1.1.1.r2.g2142576
pkgrel=1
pkgdesc="An unit testing framework for C with support for mock objects"
arch=('i686' 'x86_64')
url="https://cmocka.org/"
license=('Apache')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('cmocka')
conflicts=('cmocka')
options=('staticlibs')
source=("git://git.cryptomilk.org/projects/cmocka.git")
sha256sums=('SKIP')


prepare() {
  cd "cmocka"

  mkdir -p "_build"
}

pkgver() {
  cd "cmocka"

  git describe --long --tags | sed 's/^cmocka-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cmocka/_build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DUNIT_TESTING=ON ../
  make
}

check() {
  cd "cmocka/_build"

  make test
}

package() {
  cd "cmocka/_build"

  make DESTDIR="$pkgdir" install
}
