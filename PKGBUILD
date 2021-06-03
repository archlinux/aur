# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=onvifviewer
pkgver=0.13
pkgrel=1
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

sha256sums=('12bc6ff65d93289632aa1fd3dfb862c2fed9792f31092aba63e5b3bf985d52ea')

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
