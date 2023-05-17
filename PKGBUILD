# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Contributor: chn <g897331845@gmail.com>
pkgname=xwidgets
pkgver=0.28.0
pkgrel=1
pkgdesc="C++ backend for Jupyter interactive widgets"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=('custom:BSD-3-clause')
depends=(xtl xeus xproperty nlohmann-json jupyter-widgetsnbextension)
makedepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jupyter-xeus/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('31447d0430906249a73093e20376003d6f4c1f0b43c009269c7378f6f0d53b2fb1a2941735fb33d1e4846fded04821c2ea03886b02e16bc1800160155d2dff3b')

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
