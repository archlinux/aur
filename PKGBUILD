# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=qterminal
pkgname=$_pkgname-nopopup-git
pkgver=0.7.1
pkgrel=1
pkgdesc="Lightweight Qt-based terminal emulator - Patched to hide resize popup"
arch=("i686" "x86_64")
url="https://github.com/lxde/qterminal"
license=("GPL2")
provides=("$_pkgname" "$_pkgname-nopopup-git")
conflicts=("$_pkgname")
depends=("qtermwidget-nopopup-git")
makedepends=("lxqt-build-tools")
_commit=c12cb924bcf808369e262be1dc8f4e21eb935d33
source=("git+https://github.com/lxde/$_pkgname.git#commit=$_commit"
        "qterminal-nopopup.patch")
sha256sums=("SKIP" "SKIP")

prepare() {
    cd qterminal
    patch -p1 -i ../qterminal-nopopup.patch
}

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

