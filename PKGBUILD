# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com

pkgname=clad
pkgver=0.9
pkgrel=1
pkgdesc='Enables automatic differentiation for C++'
arch=(x86_64)
license=(LGPL)
url='https://github.com/vgvassilev/clad'
depends=(llvm clang)
makedepends=()
optdepends=()
source=(https://github.com/vgvassilev/clad/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('0876cd1d00eb222f39b34b1db3dc5f9b873b7a26af01e98bf5fb1950670583d2')

prepare () {
  if [ ! -d "$srcdir"/build ]; then
    mkdir "$srcdir"/build
  fi
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir"/clad-${pkgver} \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/usr/lib/cmake/llvm \
    -DClang_DIR=/usr/lib/cmake/clang \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
  make
}

check() {
  cd "$srcdir"/build
  make check-clad
}

package() {
  cd "$srcdir"/build
  make install
}
