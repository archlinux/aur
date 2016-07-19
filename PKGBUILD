# Maintainer: David Koňařík (dvdkon) <dvd.kon@gmail.com>
pkgname=remake
pkgver=4.1_1.1
pkgrel=1
pkgdesc="Enhanced version of GNU make with better error reporting and other \
functionality"
arch=("i686" "x86_64")
url="http://bashdb.sourceforge.net/remake/"
license=("GPL3")
depends=("guile")
_upstream_ver1="$(sed -Ee 's/^([0-9.]+)_([0-9.]+)$/\1+dbg-\2/g' <<< "$pkgver")"
_upstream_ver2="$(sed -Ee 's/^([0-9.]+)_([0-9.]+)$/\1+dbg\2/g' <<< "$pkgver")"
source=("http://downloads.sourceforge.net/project/bashdb/$pkgname/\
$_upstream_ver1/remake-$_upstream_ver2.tar.bz2")
md5sums=('31ea8f49313636ec252692b7429d637a')

build() {
	cd "$srcdir/remake-$_upstream_ver2"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/remake-$_upstream_ver2"
	make DESTDIR="$pkgdir" install
	mv "$pkgdir/usr/include/gnumake.h" "$pkgdir/usr/include/remake.h"
}

