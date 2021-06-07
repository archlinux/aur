# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=onvifviewer
pkgver=0.13
pkgrel=2
pkgdesc='ONVIF camera viewer for Plasma Mobile and Linux desktop'
arch=(x86_64)
license=('GPL3')
depends=(
  'qt5-base'
  'kdsoap'
  'breeze-icons'
  'kxmlgui'
  'kdsoap-ws-discovery-client'
  'kirigami2'
  'qtav'
)
makedepends=(
  'cmake'
  'make'
  'extra-cmake-modules'
  'ki18n'
  'kcoreaddons'
  'appstream-qt'
  'git'
)
source=("https://gitlab.com/caspermeijn/onvifviewer/-/archive/v${pkgver}/onvifviewer-v${pkgver}.tar.gz")

sha256sums=('3a55022f59a9a8c3ccacc6bb8d7f7e329157c3034001c528530751ae7cb2cad2')

build() {
  cd "onvifviewer-v${pkgver}"

#  for f in "${srcdir}"/*.patch; do
#    patch -Np1 < $f
#  done

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S . -B build
  cmake --build build
}

package() {
  cd "onvifviewer-v${pkgver}"

  cmake --install build --prefix "${pkgdir}/usr"
}
