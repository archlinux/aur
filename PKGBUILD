# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>
pkgname=gdb-powerpc-wrs-vxworks
pkgver=7.9.1
pkgrel=1
pkgdesc="GDB for the VxWorks 6.3 GCC Toolchain"
arch=('i686' 'x86_64')
provides=('gdb-powerpc-wrs-vxworks')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
depends=('wrs-vxworks-headers' 'xz' 'python')
options=('!strip' 'libtool' '!zipman' 'staticlibs')
source=(http://ftp.gnu.org/gnu/gdb/gdb-"$pkgver".tar.xz)
sha512sums=('eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414')

build() {
	cd $srcdir

	mkdir -p build && cd build
	../gdb-$pkgver/configure \
		--prefix=/usr \
		--target=powerpc-wrs-vxworks \
		--disable-nls
	make ${MAKEFLAGS} || return 1
}

package() {
  cd "$srcdir/build"
	make ${MAKEFLAGS} DESTDIR=$pkgdir install || return 1

	rm -rv $pkgdir/usr/share/info
	rm -rv $pkgdir/usr/include
	rm -rv $pkgdir/usr/share/gdb
}

# vim:set ts=2 sw=2
