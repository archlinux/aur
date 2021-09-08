# Maintainer: Daniel Reibl <janos.daniel.reibl@pm.me>
pkgname=ser-player
pkgver=1.7.3
pkgrel=2
pkgdesc="A simple SER files player, a file format used in astronomy."
url="https://github.com/cgarry/ser-player"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('qt5-base' 'libpng')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/cgarry/ser-player/archive/v${pkgver}.tar.gz" "ser-player.pro.patch" "fix_frame_slider.patch")
sha1sums=('2ed72ec494815001334d84267099797c7db4fb37' '20da0e25af1fbc3007b9484b61a69de3ab905651' '7ccfc2703cfdf0255ff0f88ff20284269b37dc13')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch ser-player.pro ../ser-player.pro.patch
  patch src/frame_slider.cpp ../fix_frame_slider.patch
  qmake-qt5 ser-player.pro DEFINES+=DISABLE_NEW_VERSION_CHECK CONFIG+=release APPIMAGE=
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
