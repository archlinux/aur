# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=kokkos
pkgver=4.0.00
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=(Apache)
depends=(bash hwloc)
makedepends=(cmake)
conflicts=('trilinos')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c205d81a0556d39cd91a38254818f9c698340c313d4e33fea8e18ad9cdc0b5465585996f3224563efa2e40e9b62e676e2baf67b221eb8621d2dfa4da5282428d')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DKokkos_ENABLE_HWLOC=ON \
    -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_TESTS=ON \
    -DKokkos_ENABLE_EXAMPLES=ON \
    -Wno-dev
  cmake --build build --target all
}

# check() {
#   ctest --test-dir build
# }

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
