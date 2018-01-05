# $Id: PKGBUILD 276082 2017-12-26 02:22:10Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe
pkgver=1.42
pkgrel=1
pkgdesc="X File Explorer (Xfe) is an MS-Explorer like file manager for X."
arch=('x86_64')
url="http://roland65.free.fr/xfe"
license=("GPL")
depends=('fox>=1:1.6' 'fox<1:1.7' 'freetype2')
makedepends=('intltool')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('34326f185070db02e7419f85f7967cdf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  export CFLAGS="$CFLAGS `pkg-config --cflags freetype2`"
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
