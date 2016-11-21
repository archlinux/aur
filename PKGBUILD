# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=locarna
pkgver=1.8.11
pkgrel=1
pkgdesc='Global and Local Alignment of RNAs'
arch=('i686' 'x86_64')
url="http://www.bioinf.uni-freiburg.de/Software/LocARNA/"
license=('GPL3')
depends=('viennarna>=2.3.1')
checkdepends=()
source=("http://www.bioinf.uni-freiburg.de/Software/LocARNA/Releases/$pkgname-$pkgver.tar.gz")
md5sums=('2148fd8bf3175da6d8ef73eb7f03fa70')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-dynamic-liblocarna \
    --disable-static \
    --with-vrna=/usr

  make
}

check() {
   cd $srcdir/$pkgname-$pkgver

   make check
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  # cleanup after dirty install ...
  install -d $pkgdir/usr/lib/perl5
  mv $pkgdir/usr/lib/perl $pkgdir/usr/lib/perl5/vendor_perl

  for perlmodule in $pkgdir/usr/bin/*.pm ; do
    mv $perlmodule $pkgdir/usr/lib/perl5/vendor_perl
  done
}
