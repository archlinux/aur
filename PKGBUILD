# Maintainer: Daniel Mirkin <danielmirkin@gmail.com>
# Contributor: Andrew Bibb <ajbibb@outlook.com>

pkgname=cmst
pkgver=2022.03.13
pkgrel=1
pkgdesc="A QT based GUI front end for the connman connection manager"
arch=('x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('custom:MIT')
depends=('qt5-base' 'hicolor-icon-theme' 'connman')
makedepends=('qt5-tools')
source=("$url/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('6960303f2a22a357bbe24d7c553e60559afdda08a40c07042b9236693a98abf5')
prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/^conf.path =/c conf.path = /usr/share/dbus-1/system.d' apps/rootapp/rootapp.pro
}

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 DISTRO=arch
	make
}


package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
