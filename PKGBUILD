# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-config
pkgname=$_pkgname-git
pkgver=0.9.0.66.gfc07877
pkgrel=1
pkgdesc="LXQt system configuration."
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("liblxqt-git" "libxcursor" "qt5-svg")
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
	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
