# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=xeus-python
pkgver=0.17.1
pkgrel=1
pkgdesc="Jupyter kernel for the Python programming language"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=(BSD-3-Clause)
depends=(pybind11-json xeus-zmq python-xeus-python-shell jupyterlab)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d84089364a673ddb76d40f96b75ab8161bc0f46c94c2727a5c9f4e15bcb9673eebe59b2a6f3c7eedb46b7457fc75125109710785ed2eb0db7b7922f62b638668')

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
