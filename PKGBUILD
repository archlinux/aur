# Maintainer: Marcin Mikołajczak <me@m4sk.in>
# Previous maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lximage-qt
pkgname=$_pkgname-git
pkgver=0.7.0.79.g875346e
pkgrel=2
pkgdesc="The LXQt image viewer"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=("libfm-qt-git" "qt5-x11extras" "qt5-svg" "hicolor-icon-theme")
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
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
