# Maintainer: Maxim Devaev <mdevaev@gmail.com>

_commit=3b9869fb240a4670ce9f9bf4c84c851b3b778a4e
pkgname=qtcurve
pkgver=20261123
pkgrel=1
pkgdesc="A configurable set of widget styles for KDE and Gtk (Qt6 fork)"
arch=(x86_64)
url="https://invent.kde.org/system/qtcurve"
license=(LGPL)
groups=(qtcurve)
depends=(
	qt6-base
	qt6-svg
	libxcb
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
		-DENABLE_QT5=OFF \
		-DENABLE_QT6=ON \
		-DQTC_QT6_ENABLE_KDE=ON
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
