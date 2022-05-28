# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ampl-asl
_gitcommit=a472ade54461f0ed9dbec5bca69889e1dcdf6e89
pkgver=20220520
pkgrel=1
pkgdesc="AMPL Solver Library"
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=('custom')
depends=(openmp)
makedepends=(cmake git)
source=("git+${url}#commit=${_gitcommit}")
sha512sums=('SKIP')

build() {
  cmake \
    -S "asl" \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
