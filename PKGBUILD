# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
pkgname=wol_qt
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="Qt gui for sending WakeOnLan packets"
arch=(x86_64)
url="https://github.com/stefmitropoulos/wol_qt"
license=('GPL')
#depends=(
#    'libc.so'
#    'libQt5Widgets.so'
#    'libQt5Core.so'
#    'libstdc++.so'
#    'libgcc_s.so'
#)

makedepends=('gcc'
             'cmake')
backup=()
options=()
install=
changelog=
source=("linet::https://github.com/stefmitropoulos/linet/archive/master.tar.gz"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/stefmitropoulos/wol_qt/archive/master.tar.gz"
        )
md5sums=('2b83a75ee4e31632de5390b8eebaac57'
         '38d7f678b2eca4c859f973378c274792')

prepare() {
  mkdir "$pkgname-master"/build
	mv linet "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-master/build"
  cmake ..
  make -j$(nproc)
}

package() {
	cd "$pkgname-master"/build
	make DESTDIR="$pkgdir/" install
}
