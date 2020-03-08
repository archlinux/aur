# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=binutils-ia16
pkgver=20190928
pkgrel=1
epoch=
pkgdesc="IA-16 (Intel 16-bit x86) port of GNU Binutils"
arch=('x86_64')
url="https://github.com/tkchia/binutils-ia16"
license=('GPL')
depends=(glibc zlib)
checkdepends=(dejagnu bc)
options=(staticlibs !distcc !ccache)
source=("https://github.com/tkchia/binutils-ia16/archive/binutils-ia16-$pkgver.tar.gz")
md5sums=('3aa191808e034db66e9031a0be1e2c3d')

build() {
	mkdir -p build-binutils
	cd build-binutils
	unset CPPFLAGS
	../binutils-ia16-binutils-ia16-$pkgver/configure \
		--prefix=/usr \
		--target=ia16-elf \
		--disable-gdb \
		--disable-libdecnumber \
		--disable-readline \
		--disable-sim \
		--disable-nls \
		--disable-werror
	make configure-host
	make tooldir=/usr
}

package() {
	cd build-binutils
	make DESTDIR="$pkgdir/" install
	rm -rf "$pkgdir/usr/share"
}
