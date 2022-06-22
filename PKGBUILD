# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=kokkos
pkgver=3.6.01
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=('custom:BSD-3-clause')
depends=(bash hwloc)
makedepends=(cmake)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('0fa6aa921b6fe56cb464678d9c114e5c9f3ed1ed2f26f704dd7a37e596ca9b2daacc8a9885ff0144234bcb02c83f00c0646dd9963517326609a4dc29e4d7c7a6')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=14 \
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
