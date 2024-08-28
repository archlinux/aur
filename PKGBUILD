# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Contributor: chn <g897331845@gmail.com>
pkgname=xwidgets
pkgver=0.29.0
pkgrel=1
pkgdesc="C++ backend for Jupyter interactive widgets"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=(BSD-3-Clause)
depends=(xtl xeus xproperty nlohmann-json jupyterlab-widgets)
makedepends=()
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('8fd6d005ffa5ea7c14beaf9ace5e60ac3df7dfb12b10bb864f2f5f2e1b29937a866741e77c672e22e166cd08eddfb80c177a700e5b3912a81eb2ac12671fe1e2')

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
