# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Andrew Bibb <ajbibb@myfairpoint.net>
pkgname=cmst
pkgver=2020.11.01
pkgrel=1
pkgdesc="A QT based GUI front end for the connman connection manager"
arch=('x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('custom:MIT')
depends=('qt5-base' 'connman' 'libxkbcommon-x11' 'hicolor-icon-theme')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('b81d56fa363b2e700090bc6901d22d42b6f0a0da9547ab8c6fca7ec93b17c14a')

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
