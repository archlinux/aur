# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=wxmaxima
pkgver=24.08.0
pkgrel=1
pkgdesc="A wxWidgets GUI for the computer algebra system Maxima"
arch=(x86_64)
url="https://github.com/${pkgname}-developers/${pkgname}"
license=(GPL-2.0-or-later)
depends=(maxima wxwidgets-gtk3 webkit2gtk-4.1)
makedepends=(cmake)
checkdepends=(xorg-server-xvfb)
optdepends=('bash-completion: for completion when using bash'
  'man-db: manual pages for wxMaxima')
source=(${pkgname}-${pkgver}::${url}/archive/Version-${pkgver}/${pkgname}-Version-${pkgver}.tar.gz
  ${pkgname}-${pkgver}.asc::${url}/releases/download/Version-${pkgver}/Version-${pkgver}.tar.gz.asc)
validpgpkeys=('53F047CE66B91B0F724C545D5C86C0E4211D5B8E') # Gunter Königsmann <wxmaxima@physikbuch.de>
sha512sums=('2e0a46c9cedc938cfa9deb444b9f3f222c2f49db762b617deba0ee67710454e5cecb1611bfac64385b4161724a1356eae57fd433e5c44486df799d3675dcd8c4'
            'SKIP')

build() {
  cmake \
    -S ${pkgname}-Version-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -Wno-dev
  cmake --build build
}

# check() {
#   cmake --build build --target update-locale
#   xvfb-run -a ctest --test-dir build # ./build/src/wxmaxima build/test/automatic_test_files/testbench_simple2.mac.wxmx
# }

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
