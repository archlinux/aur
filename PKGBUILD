# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=xeus-python
pkgver=0.17.6
pkgrel=1
pkgdesc="Jupyter kernel for the Python programming language"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=(BSD-3-Clause)
depends=(pybind11-json xeus-zmq python-xeus-python-shell jupyterlab)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('38e3216bb802512c701dd25db8fd3dff4978884c53f788a5cd16ab33a14f600250200eb9424e513d2964fbb9d6cca2c786c5df5edccd18266f7a73de88566dd4')

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
