# Maintainer: X0rg

_realname=CPU-X
pkgname=cpu-x-git
pkgver=3.2.4.r55.g2c44e34
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64')
url="http://X0rg.github.io/CPU-X/"
license=('GPL3')
depends=('gtk3' 'ncurses' 'curl' 'json-c' 'libcpuid' 'pciutils' 'procps-ng')
makedepends=('cmake' 'nasm')
provides=('cpu-x')
conflicts=('cpu-x')
source=("git+https://github.com/X0rg/CPU-X.git")
md5sums=('SKIP')

pkgver() {
	cd "$_realname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	msg2 "Make 'build' directory..."
	mkdir -pv "$srcdir/$_realname/build"
}

build() {
	cd "$_realname/build"
	msg2 "Run 'cmake'..."
	cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/cpu-x ..

	msg2 "Run 'make'..."
	make
}

package() {
	cd "$_realname/build"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install
}
