# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Matthew Stobbs <matthew@stobbstechnical.com>

_pkgname=lxqt-admin
pkgname=$_pkgname-git
pkgver=0.9.0.14.gdce4b16
pkgrel=2
pkgdesc="LXQt system administration"
arch=("i686" "x86_64" "armv6h")
url="http://lxqt.org"
license=("LGPL")
depends=("liblxqt-git" "liboobs")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_pkgname"
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
