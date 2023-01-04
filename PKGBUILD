# Maintainer: Martin <martin.marmsoler@gmail.com>

pkgname=dbc_parser_cpp-git
pkgver=r34.g23689d8
pkgrel=1
pkgdesc="C++ DBC Parser"
arch=('i686' 'x86_64')
url="https://github.com/LinuxDevon/dbc_parser_cpp"
license=('custom')
depends=('catch2')
makedepends=('git' 'cmake')
provides=('dbc')
conflicts=('dbc')
options=('staticlibs')
source=("git+https://github.com/LinuxDevon/dbc_parser_cpp.git")
sha256sums=('SKIP')


pkgver() {
  cd "dbc_parser_cpp"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "dbc_parser_cpp"
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_DOCUMENTATION=OFF \
    ./
  make -C "_build"
}

check() {
  cd "dbc_parser_cpp"

  make -C "_build" test
}

package() {
  cd "dbc_parser_cpp"

  make -C "_build" DESTDIR="$pkgdir" install
}
