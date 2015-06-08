# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=g2
pkgver=0.72
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="2D graphics library; can be used with C, C++, Fortran to generate flow charts."
depends=('gd' 'gcc' 'libpng' libjpeg'')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.patch" )
md5sums=('4b2dc9252c1c785dcb0e0a84d7ba7119'
         '0da69af435b52809f43e1fdf5610daa4')
license=('GPL')
url="http://sourceforge.net/projects/g2/?source=directory"

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../$pkgname-$pkgver.patch
  ./configure --prefix=/usr CFLAGS="-fPIC"
  make libg2.so libg2.a
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make LIBDIR=$pkgdir/usr/lib INCDIR=$pkgdir/usr/include install 
  install -Dm755 libg2.so.0.$pkgver $pkgdir/usr/lib/libg2.so.0.$pkgver
  cd $pkgdir/usr/lib
  ln -s libg2.so.0.$pkgver libg2.so
}
