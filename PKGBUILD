# Maintainer: Maxim Devaev <mdevaev@gmail.com>

_commit=84f1ebe188fb0405c259d153c570daa4d3f48a67
pkgname=qtcurve
pkgver=20240511
pkgrel=1
pkgdesc="A configurable set of widget styles for KDE and Gtk (Qt6 fork)"
arch=(x86_64)
url="https://invent.kde.org/system/qtcurve"
license=(GPL)
groups=(qtcurve)
depends=(
	qt5-base
	qt5-svg
	qt5-x11extras
	qt6-base
	qt6-svg
	libxcb
	gtk2
	libx11
	gcc-libs
	frameworkintegration
)
makedepends=(
	git
	cmake
	extra-cmake-modules
	kio
	kconfig
)
conflicts=(
	qtcurve-gtk2
	qtcurve-kde
	qtcurve-qt5
	qtcurve-utils
)
source=("git+https://invent.kde.org/system/qtcurve.git#commit=$_commit")
md5sums=(SKIP)


build() {
	cd "$srcdir/$pkgname"
	rm -rf build
	mkdir build
	cd build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_QT5=ON \
		-DENABLE_QT6=ON
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
