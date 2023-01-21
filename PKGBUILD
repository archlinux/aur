# Maintainer: Martin <martin.marmsoler@gmail.com>

pkgname=dbclib-git
pkgver=r24.g3482012
pkgrel=1
pkgdesc="CAN DBC C++ library."
arch=('i686' 'x86_64')
url="https://github.com/ihedvall/dbclib"
license=('MIT')
depends=('mdflib-git')
makedepends=('git' 'cmake')
provides=('dbclib')
conflicts=('dbclib')
options=('staticlibs')
source=("git+https://github.com/ihedvall/dbclib.git")
sha256sums=('SKIP')


pkgver() {
  cd "dbclib"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "dbclib"
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DDBC_TOOLS:BOOL=OFF \
    ./
  make -C "_build"
}

check() {
  cd "dbclib"

  make -C "_build" test
}

package() {
  cd "dbclib"

  make -C "_build" DESTDIR="$pkgdir" install
}
