# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=onvifviewer
pkgver=0.12
pkgrel=3
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
source=("https://gitlab.com/caspermeijn/onvifviewer/-/archive/v${pkgver}/onvifviewer-v${pkgver}.tar.gz"
        'Patch-97-onvifdevicediscover-move-over-to-changed-api-of-kdsoap-ws-discovery-client.patch')
sha256sums=('23dc08c573766688527b8f88d8e3765700f83c72f033b9a42ff9752e0ab487db'
            '074cb2b89a784e51aa8ab9fa5b999dcc36bda92e90b09dbf3cad1cda9d97a00d')

build() {
  cd "onvifviewer-v${pkgver}"

  for f in "${srcdir}"/*.patch; do
    patch -Np1 < $f
  done

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
