# Maintainer: éclairevoyant

_pkgname=qt6ct
pkgname="$_pkgname-git"
epoch=1
pkgver=0.7.r2.14a8f91
pkgrel=1
pkgdesc='Qt6 Configuration Tool'
arch=('x86_64')
url="https://github.com/trialuser02/$_pkgname"
license=('BSD')
depends=('gtk2' 'qt6-base' 'qt6-svg')
makedepends=('git' 'qt6-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	/usr/lib/qt6/bin/qmake PREFIX=/usr
	make
}

package() {
	cd $_pkgname
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
