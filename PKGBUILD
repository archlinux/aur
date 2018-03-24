# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=ser-player
pkgver=1.7.2
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
source=("https://github.com/cgarry/ser-player/archive/v1.7.2.tar.gz" "ser-player.pro.patch")
sha1sums=('b77169046704453c7e22eb591da6b3b0db457534' '20da0e25af1fbc3007b9484b61a69de3ab905651')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch < ../ser-player.pro.patch
  qmake-qt5 ser-player.pro DEFINES+=DISABLE_NEW_VERSION_CHECK CONFIG+=release APPIMAGE=
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
