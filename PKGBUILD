# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=gridformat
pkgver=0.2.0
pkgrel=1
pkgdesc="Header-only C++-Library for grid file I/O"
arch=(x86_64)
url="https://github.com/dglaeser/${pkgname}"
license=(MIT)
depends=(zlib lz4 xz hdf5-openmpi) #  highfive cgal onetbb metis
makedepends=(cmake)
# checkdepends=(deal-ii dune-grid dolfinx mfem) # dune-localfunctions
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5ea2dcfbe9f5a1d640ac83a693da89bb7d05321bf9359b9440c5c69318af24384a7d2b2380607089c6b7aee2134b2749fc6fece5a50e0e8bc3c1759244557f7e')

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
