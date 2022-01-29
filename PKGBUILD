# Maintainer: Daniel Mirkin <danielmirkin@gmail.com>
# Contributor: Andrew Bibb <ajbibb@outlook.com>

pkgname=cmst
pkgver=2022.01.05
pkgrel=1
pkgdesc="A QT based GUI front end for the connman connection manager"
arch=('x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('custom:MIT')
depends=('qt5-base' 'connman' 'libxkbcommon-x11' 'hicolor-icon-theme')
source=("$url/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('6ddc0e3a702592ec98b80164aa2b5ad1edb66d3f8dce18a545f26a67a46dc13a')
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
