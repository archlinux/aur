# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: tardo <tardo@nagi-fanboi.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=p2c
pkgver=1.21alpha2
pkgrel=11
pkgdesc="pascal to c/c++ converter"
arch=('x86_64')
url="http://packages.debian.org/sid/p2c"
license=('GPL')
depends=('perl')
#	http://ftp.debian.org/debian/pool/main/p/p2c/p2c_$pkgver-3.diff.gz)
source=(http://www.ccrnp.ncifcrf.gov/~toms/p2c/p2c-$pkgver.tar.gz)
md5sums=('8340429ae80be2e0e82c01f70c0355bb')

build() {
  cd "$srcdir"
#  patch -Np1 <../p2c_$pkgver-3.diff

  cd src
  sed -i 's#getline#xgetline#' *.c *.hdrs
  make \
	BINDIR=/usr/bin \
	MANDIR=/usr/share/man/man1 \
	LIBDIR=/usr/lib \
	HOMEDIR=/usr/lib/p2c \
	INCDIR=/usr/include/p2c \
	ABSHOMEDIR=/usr/lib/p2c \
	ABSLIBDIR=/usr/lib \
	ABSINCDIR=/usr/include/p2c
}

package() {
  cd "$srcdir"/src

  mkdir -p  "$pkgdir"/usr/bin \
	    "$pkgdir"/usr/share/man/man1 \
	    "$pkgdir"/usr/lib \
	    "$pkgdir"/usr/include/p2c
  make install \
	BINDIR="$pkgdir"/usr/bin \
	MANDIR="$pkgdir"/usr/share/man/man1 \
	LIBDIR="$pkgdir"/usr/lib \
	HOMEDIR="$pkgdir"/usr/lib/p2c \
	INCDIR="$pkgdir"/usr/include/p2c \
	ABSHOMEDIR="$pkgdir"/usr/lib/p2c \
	ABSLIBDIR="$pkgdir"/usr/lib \
	ABSINCDIR="$pkgdir"/usr/include/p2c
}
