# Maintainer: Dominik Heidler <dominik@heidler.eu>
pkgname=rtl_433-git
pkgver=18.12.r127.g92617a4
pkgrel=1
pkgdesc="Turns your Realtek RTL2832 based DVB dongle into a 433.92MHz generic data receiver"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
depends=('rtl-sdr')
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=('rtl_433')
conflicts=('rtl_433')
url="https://github.com/merbanan/rtl_433"
source=('git://github.com/merbanan/rtl_433.git')
md5sums=('SKIP')

_gitname=rtl_433

pkgver() {
	cd $srcdir/$_gitname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_gitname
	pwd
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $srcdir/$_gitname/build
	make DESTDIR=$pkgdir install
}
