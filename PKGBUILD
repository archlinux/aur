# Maintainer: Timo S. Prinz <t.prinz@coliza.de>

pkgname=librevna-gui
pkgver=1.6.4
pkgrel=1
pkgdesc="GUI application for the LibreVNA, a 100kHz to 6GHz 2 port USB based VNA"
arch=('x86_64')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')

depends=('qt6-base' 'qt6-svg')
makedepends=('qt6-tools')
optdepends=('librecal-udev: udev rules for LibreCAL control')

source=("https://github.com/jankae/LibreVNA/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73c4f32c1703bd9a431b2f67b79fb5eae2e6c17ebda8de429979333ca897518c')

build() {
  local _src="$srcdir/LibreVNA-${pkgver}/Software/PC_Application/LibreVNA-GUI"
  cd "$_src"
  qmake6 LibreVNA-GUI.pro
  make
}

package() {
  local _top="$srcdir/LibreVNA-${pkgver}/Software/PC_Application"
  install -Dm755 "$_top/LibreVNA-GUI/LibreVNA-GUI" "$pkgdir/usr/bin/LibreVNA-GUI"
  install -Dm644 "$_top/51-vna.rules" "$pkgdir/etc/udev/rules.d/51-vna.rules"
}

