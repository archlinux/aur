# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
pkgname=wol_qt
pkgver=2.4
pkgrel=3
pkgdesc="Qt gui to ARP scan and send WakeOnLan packets"
arch=(x86_64)
url="https://github.com/stefmitropoulos/wol_qt"
license=('GPL')

depends=('qt5-base'
         'net-tools')

makedepends=('gcc'
             'cmake')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/stefmitropoulos/wol_qt/archive/v${pkgver}.tar.gz"
    "linet.tar.gz::https://github.com/stefmitropoulos/linet/archive/v1.4.tar.gz"
    "wol_qt.desktop"
    "wol_qt_icon.png"
)
sha256sums=('9ddbd09a6cf3a1e1696acf9aeea1119204ae7770bf720f88649c2be7d8a292c8'
            '709c3972e28c96c846ec4c10d00de19c4085c0876daedf96bc26b3108f0b0b45'
            '19b60f302264bc61f728fdcec40e58e2a2d6dbfab60569e33f230a70bf6ec49f'
            '6b870a8d18b2e2b710829594708996de847b83df360df27b0606aecb69210287')

prepare() {
  mkdir "${pkgname}-${pkgver}/build"
	mv linet-*/* "${pkgname}-${pkgver}/linet"
}

build() {
	cd "${pkgname}-${pkgver}/build"
  cmake ..
  make 
}

package() {
	cd "${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
echo `pwd`
cd ../..
    install -Dm644 wol_qt_icon.png      $HOME/.icons/wol_qt_icon.png
    install -Dm644 wol_qt.desktop       $HOME/.local/share/applications/wol_qt.desktop
}
