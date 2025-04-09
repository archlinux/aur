# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=gridformat
pkgver=0.4.0
pkgrel=1
pkgdesc="Header-only C++-Library for grid file I/O"
arch=(x86_64)
url="https://github.com/dglaeser/${pkgname}"
license=(MIT)
depends=(zlib lz4 xz hdf5-openmpi) #  highfive cgal onetbb metis
makedepends=(cmake)
# checkdepends=(deal-ii dune-grid dolfinx mfem) # dune-localfunctions
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('78b3d97ef4d3eea22cfbbd0e8679774c0509cf5d7901a26e9f6e1f76c31f13c0bf56174bae5bae793754d68957a8edd8711b6f39554ae597e60bae0c45dfe9b7')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGRIDFORMAT_BUILD_BINARIES=ON \
    -DGRIDFORMAT_BUILD_TESTS=ON

  cmake --build build --target all
}

# check() {
#   cmake --build build --target build_tests
#   ctest --verbose --output-on-failure --test-dir build
# }

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
