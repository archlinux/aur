# Maintainer: Lucas Betschart <lucasbetschart@gmail.com>
pkgname=digital-bitbox-app
pkgver=0.2.1
pkgrel=1
pkgdesc="A Qt based application for the Digital Bitbox hardware wallet."
arch=('x86_64')
url="https://digitalbitbox.com/"
license=('MIT')
depends=('hidapi' 'curl' 'libevent' 'avahi' 'qrencode' 'qt5-base' 'qt5-tools' 'qt5-websockets')
#install=

source=(https://github.com/digitalbitbox/dbb-app/archive/v$pkgver.tar.gz)
sha256sums=('878fffc3c2fcd3ff3776a9be285606a58fee3eb07f4f4191396736b5ef440f7e')

noextract=()
md5sums=()
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
