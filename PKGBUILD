# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=xeus-python
pkgver=0.16.0
pkgrel=1
pkgdesc="Jupyter kernel for the Python programming language"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=(BSD-3-Clause)
depends=(pybind11-json cppzmq xeus-zmq python-xeus-python-shell jupyterlab)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('48846ab26f2a9e825a8b4a1dd336c8413590767ca2215a12757c74367a1bc5f4f1edd3f0ccc252c3b839dd465f3115b3fce64a6047aae3487d3fde97b6521268')

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
