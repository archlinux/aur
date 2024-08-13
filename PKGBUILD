# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=kokkos
pkgver=4.4.00
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=(Apache-2.0)
depends=(bash hwloc openmp)
makedepends=(cmake)
# checkdepends=(gtest)
conflicts=('trilinos')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('3c9a376e4304268b647d06469fc9baacf1ece8bba6dad7b119edf262ef59f75079114da6d3d799615e92530358c300c27aa9da151efdf62c7d822a0b020428ea')

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
    -DKokkos_ENABLE_THREADS=OFF \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=OFF \
    -DKokkos_ENABLE_EXAMPLES=OFF \
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
