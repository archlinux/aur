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
    "linet.tar.gz::https://github.com/stefmitropoulos/linet/archive/v1.4.tar.gz"
)
sha256sums=('91788c80d2cf71371dd69821636005dd4b8b6643a788ce45c066506f8a7e5a3c'
            '709c3972e28c96c846ec4c10d00de19c4085c0876daedf96bc26b3108f0b0b45')

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
