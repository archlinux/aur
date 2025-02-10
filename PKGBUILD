# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=clad
pkgver=1.9
pkgrel=1
pkgdesc='Enables automatic differentiation for C++'
arch=(x86_64)
license=(LGPL)
url='https://github.com/vgvassilev/clad'
depends=(llvm clang)
makedepends=(cmake python git)
optdepends=()
source=("git+https://github.com/vgvassilev/clad#tag=v${pkgver}")
sha256sums=('3ff5c7d8b069da286b5c7c184859518a59c2a3d30c5bad96e05420c728338ad0')

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLLVM_DIR=/usr/lib/cmake/llvm \
    -DClang_DIR=/usr/lib/cmake/clang \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -Wno-dev
  cmake --build build
}

check() {
  cd "$srcdir"/build
  CLADLIB="$srcdir"/build/lib/clad.so make check-clad
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
