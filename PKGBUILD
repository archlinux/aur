# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Huayu ZHANG <zhanghuayu.dev@gmail.com>

pkgname=gdb11
pkgver=11.2
pkgrel=2
pkgdesc="GNU debugger (version 11) for compability with clion remote debugging"
arch=(x86_64)
url="https://www.gnu.org/software/gdb"
license=('GPL')
makedepends=('gmp' 'mpfr')
depends=('xz' 'libmpc' 'gdb' 'boost' 'boost-libs') # GDB is included to prevent conflicts with it - otherwise this package won't function
replaces=("i686-elf-gdb")
conflicts=("i686-elf-gdb")
source=("https://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=('1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32')
OPTIONS=(!strip)

prepare() {
	mkdir "gdb11-build"
}

build() {
	cd "gdb11-build"
	../gdb-${pkgver}/configure --prefix=/opt/gdb11
	make -j$(nproc)
}

package() { 
	cd "gdb11-build"
	make install DESTDIR=${pkgdir}
	# Remove conflicting files
	rm -rf ${pkgdir}/usr/share/locale/
	rm -rf ${pkgdir}/usr/share/gdb
	rm -rf ${pkgdir}/usr/include/gdb
	rm -rf ${pkgdir}/usr/share/info/dir
	rm -rf ${pkgdir}/usr/share/info/
	rm -rf ${pkgdir}/usr/include/sim/callback.h
	rm -rf ${pkgdir}/usr/include/sim/sim.h
}
