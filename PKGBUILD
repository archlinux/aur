# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=papyros-shell
pkgver=0.0.5
pkgrel=3
pkgdesc="Wayland and QtQuick based desktop shell for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/papyros-shell"
license=("GPL")
depends=("qt5-base-git" "qt5-declarative-git" "qt5-quickcontrols-git" "qt5-graphicaleffects-git"
 		 "qt5-wayland-dev-git" "gsettings-qt-bzr" "qml-material" "qml-extras" "qml-desktop")
makedepends=("git" "python")
provides=("$pkgname")
source=("$pkgname::git+https://github.com/papyros/papyros-shell.git#tag=v$pkgver")
sha256sums=("SKIP")

prepare() {
	pushd "$srcdir/$pkgname"
	./qrc.py qml images > papyros-shell.qrc
	popd

	mkdir -p build
	cd build
	qmake "$srcdir/$pkgname"
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
