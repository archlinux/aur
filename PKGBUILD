# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# This PKGBUILD is inspired from the package gputils in Archlinux repos.

pkgname=gputils-svn
pkgver=1.5.1.svn1296
pkgrel=1
pkgdesc="PIC Programming Utilities"
arch=('i686' 'x86_64')
url="http://gputils.sourceforge.net/"
license=('GPL')

provides=('gputils')
conflicts=('gputils')
depends=('glibc')

source=('gputils::svn://svn.code.sf.net/p/gputils/code/trunk')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/gputils/gputils"

	local _distver=`sed -n -e 's/.*AC_INIT(\[gputils\],.*\[\(.*\)\],.*\[.*\]).*/\1/p' configure.ac`
	local _svnver="$(svnversion)"

	echo "$_distver.svn$_svnver"
}

build() {
	cd "$srcdir/gputils/gputils"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/gputils/gputils"
	make DESTDIR="$pkgdir" install
}
