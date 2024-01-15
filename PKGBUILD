# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=gridformat
pkgver=0.1.2
pkgrel=1
pkgdesc="Header-only C++-Library for grid file I/O"
arch=(x86_64)
url="https://github.com/dglaeser/${pkgname}"
license=(MIT)
depends=(zlib lz4 xz hdf5-openmpi) #  highfive cgal onetbb metis
makedepends=(cmake)
# checkdepends=(deal-ii dune-grid dolfinx mfem) # dune-localfunctions
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e14a220323fcd01058c0376b62e6b4d3ce408dd4c481dbd20349b228713c15bd60ef050cecd67191bd334cf8404ca926e011da7e2bf5c154343ed6ccd05521c5')

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
