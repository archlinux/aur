# Maintainer: Junio Calú <junio.calu@gmail.com>

pkgname=dde-top-panel
pkgver=0.4.1
pkgrel=4
pkgdesc="dde top panel for Deepin V20"
arch=('x86_64')
url="https://github.com/SeptemberHX/dde-top-panel"
license=('GPL')
depends=('deepin-network-utils' 'deepin-qt5integration' 'deepin-qt-dbus-factory' 'libdbusmenu-qt5' 'kwindowsystem' 'qt5-base'
         'procps-ng' 'deepin-dock' 'xdotool')
makedepends=('cmake' 'qt5-tools')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeptemberHX/dde-top-panel/archive/$pkgver.tar.gz"
        "${pkgname}.desktop")
sha512sums=('fffeab4e7bb0af52f712889cf762cdde9cb24140cac89cf263b19087fce74fd1fdf0fff01b93802300f296c0b0fc49b3aadd8540182252795c2d21e6f5242972'
            '8f6aed15b7ef9c9480e43a1cc12c0fe9fa490aea531ca158fb73232ca88cb263325ef46c53cdc9329fba0ec7e498ac4e06ec01590e00f6033dd8387bb68f2442')

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
  install -d "${pkgdir}/usr/lib/dde-top-panel/"
  ln -s /usr/lib/dde-dock/plugins/ "${pkgdir}/usr/lib/dde-top-panel/plugins"
  install -Dm 755 "frame/dde-top-panel" "${pkgdir}/usr/bin/dde-top-panel"
  install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 "schemas/com.deepin.dde.toppanel.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/com.deepin.dde.toppanel.gschema.xml"
}
