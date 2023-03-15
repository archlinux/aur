# Maintainer: Daniel Mirkin <danielmirkin@gmail.com>
# Contributor: Andrew Bibb <ajbibb@outlook.com>

pkgname=cmst
pkgver=2023.03.14
pkgrel=1
pkgdesc="A QT based GUI front end for the connman connection manager"
arch=('x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('custom:MIT')
depends=('qt5-base' 'hicolor-icon-theme' 'connman')
makedepends=('qt5-tools')
source=("$url/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('eba0ec46b3f79fa6cb29e9d6adae25ec366ed6c619ab5737b9fad0b1d3ff5d54')

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
