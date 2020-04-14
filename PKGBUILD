# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
pkgname=wol_qt
pkgver=1.5
pkgrel=1
pkgdesc="Qt gui for sending WakeOnLan packets"
arch=(x86_64)
url="https://github.com/stefmitropoulos/wol_qt"
license=('GPL')

depends=('qt5-base')

makedepends=('gcc'
             'cmake')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/stefmitropoulos/wol_qt/archive/v${pkgver}.tar.gz"
    "linet.tar.gz::https://github.com/stefmitropoulos/linet/archive/v1.1.tar.gz"
)
sha256sums=('e6445994a6e768f7964c3cb78c9d240c321bacb65afe50659ef9b61a732e4684'
            '09d33b9d733f59f6792247a0dfcaa9414102d4a04531386679f4e49b8b326cae')

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
