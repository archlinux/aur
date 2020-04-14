# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
pkgname=wol_qt
pkgver=1.6
pkgrel=1
pkgdesc="Qt gui for sending WakeOnLan packets"
arch=(x86_64)
url="https://github.com/stefmitropoulos/wol_qt"
license=('GPL')

depends=('qt5-base')

makedepends=('gcc'
             'cmake')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/stefmitropoulos/wol_qt/archive/${pkgver}.tar.gz"
    "linet.tar.gz::https://github.com/stefmitropoulos/linet/archive/1.3.tar.gz"
)
sha256sums=('91788c80d2cf71371dd69821636005dd4b8b6643a788ce45c066506f8a7e5a3c'
            '7c2d9af700ae1ed4784b8d471d26af4ba3bbb74973d02a9bb8dd5ec468b36e4c')

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
}
