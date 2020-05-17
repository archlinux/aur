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
makedepends=('cmake' 'ninja' 'nasm')
provides=('cpu-x')
conflicts=('cpu-x')
source=("git+https://github.com/X0rg/CPU-X.git")
sha512sums=('SKIP')
options=('!strip' 'debug')

pkgver() {
	cd "$_realname"
	git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	msg2 "Generate build system..."
	cmake -S "$_realname" -B build -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr

	msg2 "Build..."
	cmake --build build
}

package() {
	msg2 "Install..."
	DESTDIR="$pkgdir" ninja -C build install

}
