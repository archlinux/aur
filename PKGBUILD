# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=kokkos
pkgver=4.2.01
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=(Apache)
depends=(bash hwloc openmp)
makedepends=(cmake)
# checkdepends=(gtest)
conflicts=('trilinos')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d5696e35f8e2d2c6e7b1c9d4bfe9a41faa0699f5c1e04f8ceffb9272f99a60dc8d7eed5ed7228ab197f15a2c21d00713ed3a26a1c437706ec02f846457e286cb')

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
