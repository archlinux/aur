# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_archivename=binutils
_target=mipsel-linux
pkgname=$_target-$_archivename
pkgver=2.14
pkgrel=2
pkgdesc="mipsel-linux binary manipulation programs"
url="http://www.gnu.org/software/$_archivename/"
depends=(glibc)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver.tar.bz2)
md5sums=('2da8def15d28af3ec6af0982709ae90a')

build() {
	cd $startdir/src/$_archivename-$pkgver
	./configure --target=$_target --prefix=/usr || return 1
	make || return 2
	make DESTDIR=$startdir/pkg install || return 3

	# we will keep libiberty from mipsel-linux-gcc3
	#mv $startdir/pkg/usr/lib/libiberty.a $startdir/pkg/usr/$_target/lib/
	#rmdir $startdir/pkg/usr/lib
	rm -rf $startdir/pkg/usr/lib
}
