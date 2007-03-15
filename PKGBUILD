# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_archivename=glibc
_target=mipsel-linux
pkgname=$_target-${_archivename}
pkgver=2.3.3
pkgrel=1
pkgdesc="mipsel-linux GNU C Library"
url="http://www.gnu.org/software/$_archivename/"
makedepends=($_target-binutils $_target-gcc3 kernel26)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver.tar.bz2)
md5sums=('e825807b98042f807799ccc9dd96d31b')

build() {
	mkdir -p $startdir/src/$_archivename-build
	cd $startdir/src/$_archivename-build
	#export CFLAGS="-march=${_target/-*/} -O2"
	export CFLAGS="-O2"
	#$startdir/src/$_archivename-$pkgver/configure \
	$startdir/src/$_archivename-$pkgver/configure --build=i686-linux-gnu \
		--host=$_target --prefix=/usr/$_target \
		--with-headers=/usr/src/linux/include \
		--enable-add-ons || return 1
	make || return 2
	make install || return 3
}
