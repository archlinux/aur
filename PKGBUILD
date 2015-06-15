# Maintainer: Natrio <natrio list ru>
# Contributor: dorphell <dorphell at archlinux dot org>
pkgname=zip-natspec
pkgver=3.0
pkgrel=2
pkgdesc="Creates PKZIP-compatible .zip files for non-latin filenames, using libnatspec patch from AltLinux."
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://www.info-zip.org/pub/infozip/Zip.html"
license=('BSD')
depends=('glibc' 'bzip2' 'libnatspec')
conflicts=('zip')
provides=('zip')
options=('!makeflags')
source=('ftp://ftp.info-zip.org/pub/infozip/src/zip30.tgz' 'zip30-natspec-asdos-mod.diff')
md5sums=('7b74551e63f8ee6aab6fbc86676c0d37' '89e224906ea45b6ed80fcd6c11cbd605')
build() {
   cd $srcdir/${pkgname/-natspec/}${pkgver/./}
   cat $startdir/zip30-natspec-asdos-mod.diff | patch -p1
   make -f unix/Makefile LOCAL_ZIP="$CFLAGS" prefix=/usr generic_gcc || return 1
}
package() {
   cd $srcdir/${pkgname/-natspec/}${pkgver/./}
   make -f unix/Makefile INSTALL=`which install` prefix=$pkgdir/usr MANDIR=$pkgdir/usr/share/man/man1 install
   install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
