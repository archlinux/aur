# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs-git
pkgver=r315.cf0c947
pkgrel=1
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
sha512sums=('3e23ce7965043adf39ad2be13fd26aa7f60f20eadab47bd56e7ec8ec405b1f8f75619aba281a7c1f79023fd2b97be0a1bdd820cb78bad5ae23bc06031541e50c')

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
