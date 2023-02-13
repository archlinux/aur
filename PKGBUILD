# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs-git
pkgver=r313.cc0eb46
pkgrel=1
pkgdesc='A simple cross-platform build system and package manager for c, c++ and zig. Inspired by rusts cargo'
arch=('x86_64')
url="https://git.dec05eba.com/sibs"
license=('GPL3')
depends=('curl' 'libarchive' 'ninja' 'cmake' 'ccache')
optdepends=(
    'lld: For using the LLVM linker which is faster than the gold linker'
)
provides=('sibs')
conflicts=('sibs')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/sibs.git.${pkgver}.tar.gz")
sha512sums=('44de4868863c274db9375e26ae39a36a093a2cb86939c5d44da905e120e7e49a90b5f480b60a2d8b8b5320ab1be3632d3e4e302a64f4722a4ea28808156961bd')

build() {
  cd "$srcdir/cmake"
  mkdir release
  cd release
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../../
  ninja
}

package() {
  cd "$srcdir/cmake/release"
  install -Dm755 sibs "$pkgdir/usr/bin/sibs"
}
