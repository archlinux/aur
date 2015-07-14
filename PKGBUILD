# $Id: PKGBUILD 100866 2013-11-12 15:53:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Tino Reichardt <milky-archlinux@mcmilk.de>

_pkgbasename=dietlibc
pkgname=lib32-$_pkgbasename
pkgver=0.33
pkgrel=3
pkgdesc="a libc optimized for small size"
arch=('x86_64')
url="http://www.fefe.de/dietlibc/"
depends=($_pkgbasename)
license=("GPL")
options=('staticlibs')
#source=(http://www.kernel.org/pub/linux/libs/dietlibc/$pkgname-$pkgver.tar.bz2)
source=("http://www.fefe.de/dietlibc/dietlibc-$pkgver.tar.bz2")
md5sums=('9d541b9a6623b04ec12e5248b82db7c0')

build() {
  cd "$_pkgbasename-$pkgver"
  make MYARCH=i386 CC="gcc -m32"
}

package() {
  cd "$_pkgbasename-$pkgver"
  make MYARCH=i386 DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/opt/diet/"{bin,include,man}/
}
