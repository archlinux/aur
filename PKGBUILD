# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wabt-git
pkgver=r2087.g5d2123b1
pkgrel=1
pkgdesc="The WebAssembly binary toolkit"
arch=('i686' 'x86_64')
url="https://github.com/WebAssembly/wabt"
license=('apache')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'clang' 'cmake' 'gcc')
provides=('wabt')
conflicts=('wabt')
options=('staticlibs')
source=("git+https://github.com/WebAssembly/wabt.git")
sha256sums=('SKIP')


prepare() {
  cd "wabt"

  git submodule update --init --recursive
}

pkgver() {
  cd "wabt"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "wabt"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "wabt"

  #make -C "_build" check
}

package() {
  cd "wabt"

  make -C "_build" DESTDIR="$pkgdir" install
}
