# Maintainer: Junio Calú <junio.calu@gmail.com>

pkgname=dde-top-panel
pkgver=0.4.1
pkgrel=0
pkgdesc="dde top panel for Deepin V20"
arch=('x86_64')
url="https://github.com/SeptemberHX/dde-top-panel"
license=('GPL')
depends=('deepin-network-utils' 'deepin-qt5integration' 'deepin-qt-dbus-factory' 'libdbusmenu-qt5'
         'procps-ng')
makedepends=('cmake' 'qt5-tools' 'xdotool')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeptemberHX/dde-top-panel/archive/$pkgver.tar.gz")
sha512sums=('fffeab4e7bb0af52f712889cf762cdde9cb24140cac89cf263b19087fce74fd1fdf0fff01b93802300f296c0b0fc49b3aadd8540182252795c2d21e6f5242972')

build() {
  cd $pkgname-$pkgver
  cmake .	\
  	-DCMAKE_INSTALL_PREFIX=/usr \
   	-DCMAKE_INSTALL_LIBDIR=/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DVERSION=${pkgver}
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 "frame/dde-top-panel" "${pkgdir}/usr/bin/dde-top-panel"
  install -Dm 644 "schemas/com.deepin.dde.toppanel.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/com.deepin.dde.toppanel.gschema.xml"
}
