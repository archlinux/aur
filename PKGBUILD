# Maintainer: Lukas Spies <lukas_dot_spies_at_web_dot_de>

_pkgname=libqpsd
pkgname=libqpsd-git
pkgver=20140927
pkgrel=1
pkgdesc="PSD & PSB Plugin for Qt/C++ (Qt4/Qt5) "
arch=("i686" "x86_64")
url="https://github.com/Code-ReaQtor/libqpsd"
license=("LGPL")
depends=("qt5-base")
# depends=("qt4")	# use this depends instead the above for Qt4 build
makedepends=("git")
source=("git://github.com/Code-ReaQtor/libqpsd")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$_pkgname"
	
	sed -i "s|\$\$\[QT_INSTALL_PLUGINS\]|$pkgdir/usr/lib/qt/plugins|" QPsdPlugin.pro
	
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
