# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-svg
pkgname=$_pkgname-git
pkgver=git
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtSvg)"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-base-git")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://code.qt.io/qt/qtsvg.git#branch=dev")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	qmake ..
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
