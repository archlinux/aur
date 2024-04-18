# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Contributor: chn <g897331845@gmail.com>
pkgname=xwidgets
pkgver=0.28.1
pkgrel=1
pkgdesc="C++ backend for Jupyter interactive widgets"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=(BSD-3-Clause)
depends=(xtl xeus xproperty nlohmann-json jupyterlab-widgets)
makedepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jupyter-xeus/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('9415468f8b458a8f51f9d04d3cdee032f1caafeec629bcf4d19e3d461362f93aecbac2de63240368aed9af7aa840d5ee055f1f6124e7ca5e7e50fec45efa3340')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
