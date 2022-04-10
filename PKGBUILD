# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=wxmaxima
pkgver=22.04.0
pkgrel=1
pkgdesc="A wxWidgets GUI for the computer algebra system Maxima"
arch=(x86_64)
url="https://github.com/${pkgname}-developers/${pkgname}"
license=(GPL2)
depends=(maxima wxgtk3)
makedepends=(cmake)
# checkdepends=(xorg-server-xvfb)
optdepends=('bash-completion: for completion when using bash'
  'man-db: manual pages for wxMaxima')
source=(${pkgname}-${pkgver}::${url}/archive/Version-${pkgver}/${pkgname}-Version-${pkgver}.tar.gz ${pkgname}-${pkgver}.asc::${url}/releases/download/Version-${pkgver}/Version-${pkgver}.tar.gz.asc)
validpgpkeys=('53F047CE66B91B0F724C545D5C86C0E4211D5B8E') # Gunter Königsmann <wxmaxima@physikbuch.de>
sha512sums=('5197dab483012b39e910208406f32f2892d9acc3c0abc8582a61a43fad4f13e95692f8e499a2d0ca1680ca2ca48ea4c4853aa04c3f18d5e3a923c11316ebbf62' 'SKIP')

build() {
  cmake \
    -S ${pkgname}-Version-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
    -Wno-dev
  cmake --build build
}

# check() {
#   cmake --build build --target update-locale test
#   xvfb-run ./build/src/wxmaxima build/test/automatic_test_files/testbench_simple2.mac.wxmx
# }

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
