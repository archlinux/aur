# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-declarative
pkgname=$_pkgname-git
pkgver=v5.5.0.beta1.48.g9dee99e
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtQml, QtQuick)"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-xmlpatterns-git")
makedepends=("git" "python")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://code.qt.io/qt/qtdeclarative.git#branch=5.5")
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
