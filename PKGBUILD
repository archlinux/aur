# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ampl-asl
_gitcommit=2f5d9de248c53a3063bba23af2013cd3db768bf8
pkgver=20240106
pkgrel=1
pkgdesc="AMPL Solver Library"
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(BSD-3-Clause)
depends=(openmp)
makedepends=(cmake git)
source=("git+${url}#commit=${_gitcommit}")
sha512sums=('4e88b5f5e9f572e2ea4f5e7decf116eada5b8ec293da0a19042765e94a041ced851f76845b24dcfda687acf0ab77f0806a6892f46cd8b348e2db481cc9a3ed68')

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
