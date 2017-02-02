# Maintainer: Maxim Schuwalow <MSchuwalow@uos.de>

_pkgname=qtermwidget
pkgname=$_pkgname-nopopup-git
pkgver=0.7.1.3.g947742c
pkgrel=1
pkgdesc="A terminal widget for Qt"
arch=("i686" "x86_64")
url="https://github.com/lxde/qtermwidget"
license=("GPL2")
provides=("$_pkgname" "$_pkgname-nopopup-git")
conflicts=("$_pkgname")
depends=("qt5-base")
makedepends=("git" "cmake")
_commit=947742cc88748557fdb82659665da034084d55f4
source=("git+https://github.com/lxde/$_pkgname.git#commit=$_commit"
        "qtermwidget-nopopup.patch")
sha256sums=("SKIP" "SKIP")

prepare() {
    cd qtermwidget

    patch -p1 -i ../qtermwidget-nopopup.patch
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
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}

