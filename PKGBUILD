# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=xeus-python
pkgver=0.15.9
pkgrel=1
pkgdesc="Jupyter kernel for the Python programming language"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=('custom:BSD-3-clause')
depends=(pybind11-json cppzmq xeus-zmq python-xeus-python-shell jupyterlab)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1324715c2c3cf777cb3d02d63d3c7917c697c338641e7ffdc5fb28a7a734efce9a3eac240b9b84351a03286083fdf92dddcc5087d3a26429ac5d6b7d783eaa31')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DXPYT_BUILD_TESTS=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
