# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-common
pkgname=$_pkgname-git
pkgver=0.9.1.14.ga211dd5
pkgrel=1
pkgdesc="Common data to run a LXQt session."
arch=("any")
url="http://lxqt.org"
license=("GPL2")
depends=("bash" "hicolor-icon-theme")
makedepends=("git" "cmake" "liblxqt" "qt5-tools")
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
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
