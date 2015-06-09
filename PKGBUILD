# Maintainer: James Barnett <jbarnet4 at tulane dot edu>
# Contributor: Shanto

pkgname=tiobench
pkgver=0.3.3
pkgrel=2
pkgdesc="Portable, fully-threaded I/O benchmark program"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tiobench/"
license=('GPL')
depends=('perl')
source=(http://downloads.sourceforge.net/project/tiobench/tiobench/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('bf485bf820e693c79e6bd2a38702a128')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/aligned_alloc/faligned_alloc/g' tiotest.c
  sed -i 's/^CLFAGS.*/CFLAGS=-O2 -Wall -fabi-version=2/g' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" DOCDIR="$pkgdir/usr/share/doc/$pkgname" install
}

# vim:set ts=2 sw=2 et:
