# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lximage-qt
pkgname=$_pkgname-git
pkgver=0.4.0.8.g512f1cf
pkgrel=1
pkgdesc="The LXQt image viewer"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("pcmanfm-qt" "qt5-x11extras")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
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
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
