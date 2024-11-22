# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=gridformat
pkgver=0.3.0
pkgrel=1
pkgdesc="Header-only C++-Library for grid file I/O"
arch=(x86_64)
url="https://github.com/dglaeser/${pkgname}"
license=(MIT)
depends=(zlib lz4 xz hdf5-openmpi) #  highfive cgal onetbb metis
makedepends=(cmake)
# checkdepends=(deal-ii dune-grid dolfinx mfem) # dune-localfunctions
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('62c323090716bad4279b023f0e55d2d9a74e09bc8f6ce838f40925c67430af38661d70a3e74171905f7f668a38bf9c5613566d19abb549b0cb13345032d6d330')

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
