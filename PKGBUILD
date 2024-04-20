# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mdspan
pkgver=0.6.0
pkgrel=1
pkgdesc="Reference implementation of mdspan targeting C++23"
arch=(x86_64)
url="https://github.com/kokkos/${pkgname}"
license=(Apache-2.0)
depends=(bash)
makedepends=(cmake)
checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d0e247b5ed5765f3ddd04634462c428b19beceb81b0b7d8221443b3f6ab122e232e85c15d56c208b244be2f6667d7e1db571848b61190b64ec110f7d31c3e0c9')

build() {
  cmake \
    -S ${pkgname}-${pkgname}-${pkgver} \
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
  install -Dm644 ${pkgname}-${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
