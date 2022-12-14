# Maintainer: Daniel Mirkin <danielmirkin@gmail.com>
# Contributor: Andrew Bibb <ajbibb@outlook.com>

pkgname=cmst
pkgver=2022.11.30
pkgrel=1
pkgdesc="A QT based GUI front end for the connman connection manager"
arch=('x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('custom:MIT')
depends=('qt5-base' 'hicolor-icon-theme' 'connman')
makedepends=('qt5-tools')
source=("$url/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('fcf6b0ed58734be973bae0856b3e99d5d5bc2ed140bbbacc7ad3a948a1c3e7c6')

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
