# $Id: PKGBUILD 4654 2008-07-08 08:58:05Z ronald $
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis
#

pkgname=checkpassword
pkgver=0.90
pkgrel=1
pkgdesc="A simple, uniform password-checking interface to all root applications."
arch=('i686' 'x86_64')
url="http://cr.yp.to/checkpwd.html"
depends=('glibc')
source=(http://cr.yp.to/checkpwd/$pkgname-$pkgver.tar.gz)
license=('custom: as-is')
md5sums=('e75842e908f96571ae56c3da499ba1fc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  # fix errno.h in glibc-2.3.x
  /bin/sed -i "s:extern int errno;:#include <errno.h>:" error.h 
  /bin/echo "gcc ${CFLAGS}" > conf-cc
  /usr/bin/make || return 1
  /bin/install -D -m 755 checkpassword $startdir/pkg/usr/bin/checkpassword

  # install copyright notice
 install -Dm644 $srcdir/$pkgname-$pkgver/README \
	$pkgdir/usr/share/licenses/$pkgname/README
}
# vim: ts=2: ft=sh
