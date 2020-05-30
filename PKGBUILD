# Maintainer: X0rg

_realname=CPU-X
pkgname=cpu-x-git
pkgver=4.0.0.r2.gbfb09b7
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64')
url="http://X0rg.github.io/CPU-X/"
license=('GPL3')
depends=('gtk3' 'ncurses' 'libcpuid' 'pciutils' 'procps-ng')
makedepends=('git' 'cmake' 'ninja' 'nasm')
provides=('cpu-x')
conflicts=('cpu-x')
options=('!strip' 'debug')
source=("git+https://github.com/X0rg/CPU-X.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_realname"
	git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "$_realname" -B build -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
