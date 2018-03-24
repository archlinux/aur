# Maintainer: X0rg

_realname=CPU-X
pkgname=cpu-x
pkgver=3.2.1
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64')
url="http://X0rg.github.io/CPU-X/"
license=('GPL3')
depends=('gtk3' 'ncurses' 'curl' 'libcpuid-git' 'pciutils' 'procps-ng')
makedepends=('cmake' 'nasm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/X0rg/CPU-X/archive/v$pkgver.tar.gz")
md5sums=('92f003bdb557a140f717ba6836cfdec8')

prepare() {
	msg2 "Make 'build' directory..."
	mkdir -pv "$srcdir/$_realname-$pkgver/build"
}

build() {
	cd "$srcdir/$_realname-$pkgver/build"
	msg2 "Run 'cmake'..."
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..

	msg2 "Run 'make'..."
	make
}

package() {
	cd "$srcdir/$_realname-$pkgver/build"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install
}
