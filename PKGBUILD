# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
appname=qflipper
pkgname=qflipper-git
basever=1.1.2
pkgver=${basever/-/}
pkgrel=1
pkgdesc="Desktop application for updating Flipper Zero firmware via PC"
url="https://flipperzero.one/update"
license=('GPL3')
arch=('x86_64')
depends=('libusb' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-svg')
makedepends=('git' 'qt5-tools')
source=($appname::git+https://github.com/flipperdevices/qFlipper#tag=${basever})
sha256sums=('SKIP')

prepare() {
	cd $appname
	git submodule init
	git submodule update
}

build() {
	mkdir $appname/build
	cd $appname/build
	qmake ../qFlipper.pro -spec linux-g++ CONFIG+=qtquickcompiler PREFIX=/usr
	make qmake_all
	make
}

package() {
	make -C $appname/build INSTALL_ROOT="${pkgdir}" install
}
