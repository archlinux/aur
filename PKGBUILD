# $Id: PKGBUILD 4639 2008-07-08 07:01:28Z ronald $
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis
#

pkgname=ucspi-unix
pkgver=0.36
pkgrel=1
pkgdesc="UNIX-domain socket client-server command-line tools."
arch=('i686' 'x86_64')
url="http://untroubled.org/ucspi-unix"
depends=('bglibs')
source=($url/$pkgname-$pkgver.tar.gz)
license=('GPL2')
md5sums=('759407949912ccb860808ae2205e8a1a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /bin/echo "gcc $CFLAGS -I/usr/lib/bglibs/include" > conf-cc
  /bin/echo "gcc -s -L/usr/lib/bglibs/lib" > conf-ld
  /usr/bin/make || return 1
  for i in unixserver unixclient unixcat; do
    /bin/install -D -m 755 $i $startdir/pkg/usr/bin/$i
  done
  for i in unixserver.1 unixclient.1; do
    /bin/install -D -m 644 $i $startdir/pkg/usr/man/man1/$i
  done
}
# vim: ts=2: ft=sh
