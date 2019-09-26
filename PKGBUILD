# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=onvifviewer
pkgver=0.12
pkgrel=1
pkgdesc='ONVIF camera viewer for Plasma Mobile and Linux desktop'
arch=(x86_64)
license=('GPL3')
depends=(
  'qt5-base>=5.10'
  'kdsoap'
)
optdepends=(
  'qtav'
)
makedepends=(
  'cmake>=3.7'
  'make'
  'extra-cmake-modules>=5.46'
  'kirigami2>=5.48'
)
source=(
  "https://gitlab.com/caspermeijn/onvifviewer/-/archive/v${pkgver}/onvifviewer-v${pkgver}.tar.gz"
  "git+https://github.com/KDE/breeze-icons.git"
)
sha256sums=(
  '23dc08c573766688527b8f88d8e3765700f83c72f033b9a42ff9752e0ab487db'
  'SKIP'
)

build() {
  cd "onvifviewer-v${pkgver}"

  mkdir -p build

  ln -sf "${srcdir}/breeze-icons" 3rdparty/breeze-icons
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_BREEZE_ICONS=true \
    -S . -B build
  cmake --build build -j 1
}

package() {
  cd "onvifviewer-v${pkgver}"

  cmake --install build --prefix "${pkgdir}/usr"
}
