# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs
pkgver=r316.ed3a24e
pkgrel=1
pkgdesc='A simple cross-platform build system and package manager for c, c++ and zig. Inspired by rusts cargo'
arch=('x86_64')
url="https://git.dec05eba.com/sibs"
license=('GPL-3.0-only')
depends=('curl' 'libarchive' 'ninja' 'cmake' 'ccache')
optdepends=(
    'mold: For using the mold linker which is faster than the lld/gold linker'
    'lld: For using the LLVM linker which is faster than the gold linker'
)
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/sibs.git.${pkgver}.tar.gz")
sha512sums=('c3f4f04134dbccecb153bea3b99981fc5e75e27fa8e62dc41fd8d40e81ac4265e242559b19f79fce93d5b95dfafd5bd03d1f8e5fac2ec591939bc4648aedb18f')

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
