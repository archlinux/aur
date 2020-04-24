# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
pkgname=wol_qt
pkgver=2.4
pkgrel=1
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
)
sha256sums=('9ddbd09a6cf3a1e1696acf9aeea1119204ae7770bf720f88649c2be7d8a292c8'
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
