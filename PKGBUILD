# Maintainer: pisevren <aur@local>
# Contributor: Timo S. Prinz <t.prinz@coliza.de>

pkgname=librevna-gui
pkgver=1.6.5
pkgrel=2
pkgdesc="GUI application for the LibreVNA, a 100kHz to 6GHz 2 port USB based VNA"
arch=('x86_64')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')

depends=('qt6-base' 'qt6-svg')
makedepends=('qt6-tools')
optdepends=(
  'librevna-firmware: firmware files and default firmware path for device update'
  'librevna-udev: udev rules for LibreVNA device access'
  'librecal-udev: udev rules for LibreCAL control'
)

provides=('librevna-gui')
conflicts=('librevna-gui')

source=("https://github.com/jankae/LibreVNA/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('63f924d9c9fb258a379de94f922a2a4a6d2fa6552ebab63fbb91cc29a5d6aee4')

build() {
  local _src="$srcdir/LibreVNA-${pkgver}/Software/PC_Application/LibreVNA-GUI"
  cd "$_src"
  qmake6 LibreVNA-GUI.pro
  make
}

package() {
  local _root="$srcdir/LibreVNA-${pkgver}"
  local _gui="$srcdir/LibreVNA-${pkgver}/Software/PC_Application/LibreVNA-GUI"

  install -Dm755 \
    "$_gui/LibreVNA-GUI" \
    "$pkgdir/usr/bin/LibreVNA-GUI"

  ln -s "LibreVNA-GUI" \
    "$pkgdir/usr/bin/librevna-gui"

  install -d "$pkgdir/usr/share/doc/librevna"

  cp -r \
    "$_root/Documentation/"* \
    "$pkgdir/usr/share/doc/librevna/"
}
