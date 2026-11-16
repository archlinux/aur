# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mdspan
pkgver=5.3.0
pkgrel=1
pkgdesc="Reference implementation of mdspan targeting C++23"
arch=(x86_64)
url="https://github.com/kokkos/${pkgname}"
license=(Apache-2.0)
depends=(bash)
makedepends=(cmake)
checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ef342fe2f3630b94e1526788106a0bb69501f6dbb9336ec2c656f4b5806fdea21750e8ad960b6d67122d40671bcd8414ff2bc449e7509c9d269e9cf6d1def01f')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=23 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DMDSPAN_ENABLE_TESTS=ON \
    -DMDSPAN_ENABLE_EXAMPLES=ON \
    -DMDSPAN_ENABLE_BENCHMARKS=OFF \
    -DMDSPAN_ENABLE_COMP_BENCH=OFF \
    -DMDSPAN_ENABLE_CUDA=OFF \
    -DMDSPAN_ENABLE_SYCL=OFF \
    -DMDSPAN_ENABLE_SYCL=OFF \
    -DMDSPAN_ENABLE_HIP=OFF \
    -DMDSPAN_ENABLE_OPENMP=OFF \
    -DMDSPAN_USE_SYSTEM_GTEST=ON \
    -Wno-dev
  cmake --build build --target all
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
