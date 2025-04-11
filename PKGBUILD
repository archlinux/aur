# Maintainer: Timo S. Prinz <t.prinz@coliza.de>
pkgname=librevna-gui
pkgver=1.6.2
pkgrel=1
pkgdesc="GUI application for the LibreVNA, a 100kHz to 6GHz 2 port USB based VNA"
arch=('x86_64' 'i686')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg')
optdepends=('librecal-udev: udev rules for LibreCAL control')
provides=()
conflicts=()
source=("https://github.com/jankae/LibreVNA/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d195ae764fba9f5bd8a48488595bd7b865561d18f204e0ff7429989966bc465f')

prepare() {
 	cd "$srcdir/LibreVNA-${pkgver}/Software/PC_Application/LibreVNA-GUI"
}

build() {
 	cd "$srcdir/LibreVNA-${pkgver}/Software/PC_Application/LibreVNA-GUI"
  qmake6 LibreVNA-GUI.pro
  make
}

package() {
  install -Dm 755 ${srcdir}/LibreVNA-${pkgver}/Software/PC_Application/LibreVNA-GUI/LibreVNA-GUI ${pkgdir}/usr/bin/LibreVNA-GUI
  install -Dm 644 ${srcdir}/LibreVNA-${pkgver}/Software/PC_Application/51-vna.rules ${pkgdir}/etc/udev/rules.d/51-LibreVNA.rules
}
