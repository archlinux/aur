# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=qflipper
pkgver=0.9.1
pkgrel=1
pkgdesc="Desktop application for updating Flipper Zero firmware via PC"
url="https://flipperzero.one/update"
license=('GPL3')
arch=('x86_64')
depends=('libusb' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-svg')
makedepends=('git' 'qt5-tools')
source=($pkgname::git+https://github.com/flipperdevices/qFlipper#tag=${pkgver})
sha256sums=('SKIP')

prepare() {
	cd $pkgname
	git submodule init
	git submodule update
}

build() {
	mkdir $pkgname/build
	cd $pkgname/build
	qmake ../qFlipper.pro -spec linux-g++ CONFIG+=qtquickcompiler PREFIX=/usr
	make qmake_all
	make
}

package() {
	make -C $pkgname/build INSTALL_ROOT="${pkgdir}" install
}
