# Maintainer: Lucas Betschart <lucasbetschart@gmail.com>
pkgname=digital-bitbox-app
pkgver=3.0.0
pkgrel=1
pkgdesc="A Qt based application for the Digital Bitbox hardware wallet."
arch=('x86_64')
url="https://digitalbitbox.com/"
license=('MIT')
depends=('hidapi' 'curl' 'libevent' 'avahi' 'qrencode' 'qt5-base' 'qt5-tools' 'qt5-websockets')
#install=

source=(https://github.com/digitalbitbox/dbb-app/archive/v$pkgver.tar.gz)
sha256sums=('50f88caac92b1254e446de722d1cac3935ae775190ada44a55560581c14a3016')

noextract=()
validpgpkeys=()

build() {
	cd "dbb-app-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --with-gui=qt5 LDFLAGS="-lpthread"
	make
}

check() {
	cd "dbb-app-$pkgver"
	make -k check
}

package() {
	cd "dbb-app-$pkgver"
	make DESTDIR="$pkgdir/" install
}
