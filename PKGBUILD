# Maintainer: Lukas Spies <lukas_dot_spies_at_web_dot_de>

pkgname=libqpsd-git
pkgver=2.3.0.r1.f4ad69b
pkgrel=1
epoch=1
pkgdesc="PSD & PSB Plugin for Qt/C++"
arch=(x86_64)
url="https://github.com/Code-ReaQtor/libqpsd"
license=(LGPL-2.1-only)
depends=(qt6-base)
makedepends=(git)
source=("git+https://github.com/Code-ReaQtor/libqpsd")
sha256sums=("SKIP")

pkgver() {
	cd "libqpsd"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "libqpsd"
	sed -i "s|\$\$\[QT_INSTALL_PLUGINS\]|/usr/lib/qt/plugins|" QPsdPlugin.pro
	mkdir -p build
}

build() {
	cd "libqpsd/build"
	qmake6 ..
	make
}

package() {
	cd "libqpsd/build"
	make INSTALL_ROOT="$pkgdir" install
}
