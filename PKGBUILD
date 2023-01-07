# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs-git
pkgver=r312.2348c9f
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
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/sibs.git.r312.2348c9f.tar.gz")
sha512sums=('c631705e8b7c8b861a19d84be1c36d2a0597ab07fbb063fe5deef0a3d2cdd3d41856f3ba8d3ba5180016d94c69d9aedd937a79a3643a0554bebd05d43ec37578')

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
