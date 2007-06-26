# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_archivename=binutils
_target=mipsel-linux
pkgname=$_target-$_archivename
pkgver=2.15
pkgrel=1
pkgdesc="mipsel-linux binary manipulation programs"
url="http://www.gnu.org/software/$_archivename/"
depends=(glibc)
arch=(i686)
license=(GPL)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver.tar.bz2)
md5sums=('624e6b74983ac6b2960edaf2d522ca58')

build() {
	cd $startdir/src/$_archivename-$pkgver

	./configure --target=$_target --prefix=/usr || return 1
	make || return 2
	make DESTDIR=$startdir/pkg install || return 3

	# We just don't want libiberty for x86
	rm -rf $startdir/pkg/usr/lib
}
