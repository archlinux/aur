# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-config
pkgname=$_pkgname-git
pkgver=0.12.0.12.g7ac37d2
pkgrel=2
pkgdesc="LXQt system configuration."
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=("liblxqt-git" "libkscreen" "libxcursor" "qt5-svg" "hicolor-icon-theme")
makedepends=("git" "cmake" "qt5-tools" "lxqt-build-tools-git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')


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
