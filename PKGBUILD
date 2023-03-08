# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs-git
pkgver=r314.0697f41
pkgrel=2
pkgdesc='A simple cross-platform build system and package manager for c, c++ and zig. Inspired by rusts cargo'
arch=('x86_64')
url="https://git.dec05eba.com/sibs"
license=('GPL3')
depends=('curl' 'libarchive' 'ninja' 'cmake' 'ccache')
optdepends=(
    'mold: For using the mold linker which is faster than the lld/gold linker'
    'lld: For using the LLVM linker which is faster than the gold linker'
)
provides=('sibs')
conflicts=('sibs')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/sibs.git.${pkgver}.tar.gz")
sha512sums=('a3e463d681e2cf07c6bbeb49f65f23a5d8fc785a5ec7694091c9e77b24d1e37c0c4f6dc98534f552402aa64697de2f44ba25d7b986deee1d20fc76cd06dff10b')

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
