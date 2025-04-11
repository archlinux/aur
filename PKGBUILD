# Maintainer: Timo S. Prinz <t.prinz@coliza.de>
pkgname=librecal-gui
pkgver=0.2.3
pkgrel=1
pkgdesc="GUI application for the LibreCAL, a 4-port eCal module"
arch=('x86_64' 'i686')
url="https://github.com/jankae/LibreCAL"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-charts' 'qt6-svg')
provides=("${pkgname}" "${pkgname%-gui}-udev")
conflicts=("${pkgname}" "${pkgname%-gui}-udev")
source=("https://github.com/jankae/LibreCAL/archive/refs/tags/v${pkgver}.tar.gz")

# prepare() {
#  	cd "$srcdir/LibreVNA-${pkgver}/Software/PC_Application/LibreVNA-GUI"
# }

build() {
 	cd "$srcdir/LibreCAL-${pkgver}/Software/LibreCAL-GUI"
  qmake6 LibreCAL-GUI.pro
  make
}

package() {
  install -Dm 644 ${srcdir}/LibreCAL-${pkgver}/Software/52-LibreCAL.rules ${pkgdir}/etc/udev/rules.d/52-LibreCAL.rules
  install -Dm 755 ${srcdir}/LibreCAL-${pkgver}/Software/LibreCAL-GUI/LibreCAL-GUI ${pkgdir}/usr/bin/LibreCAL-GUI
}
sha256sums=('a29d45be63fa4412f8c1775d6ceeec62ff97db2db64a50001ba44935e60c9e7d')
