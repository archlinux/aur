# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=tree-puzzle
pkgver=5.3.rc16
pkgrel=1
arch=('x86_64')
pkgdesc="Maximum likelihood analysis for nucleotide, amino acid, and two-state data"
url='http://www.tree-puzzle.de/'
license=('GPL-2.0-only')
depends=('openmpi' 'glibc')
makedepends=('make' 'autoconf')
source=("${pkgname}-${pkgver}.tgz::http://www.tree-puzzle.de/tree-puzzle-${pkgver}.tar.gz"
	"ppuzzle.patch")
sha1sums=('deff2968611b9726f189d8babfd9bb908fc21a5b'
          '3557851bcabc5afc58a81a966bc48c7f9d6f1506')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < $srcdir/ppuzzle.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  autoupdate
  autoreconf -i
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # binary
  make DESTDIR="${pkgdir}" install
  # docs
  install -Dm 644 doc/*.pdf $pkgdir/usr/share/doc/$pkgname/manual.pdf  
}
