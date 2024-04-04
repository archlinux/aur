# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ampl-asl
_gitcommit=23f47c1b08efe756bc93f19a034f14fa5a0593ab
pkgver=20231111
pkgrel=1
pkgdesc="AMPL Solver Library"
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(BSD-3-Clause)
depends=(openmp)
makedepends=(cmake git)
source=("git+${url}#commit=${_gitcommit}")
sha512sums=('de5fdd7c963882129c12141c3dc7ae35b46abd84a68d90b4eea449953f5cb3614e1c63e10bcbcbd136fe9948fa070fe44c92f71f71c41ba0003d0b179feb6e02')

build() {
  cmake \
    -S asl \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 asl/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
