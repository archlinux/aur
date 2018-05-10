# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=g2
pkgver=0.72
pkgrel=6
arch=('i686' 'x86_64')
pkgdesc="2D graphics library; can be used with C, C++, Fortran to generate flow charts."
depends=('gd' 'gcc' 'libpng' 'libjpeg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/danielrmeyer/g2/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.patch" )
sha256sums=('22e1f1caf1335f260355092a4fb79adcf01d49454de970f7574cc042ede41f91'
            'f4857ac3507c362e19608a23e705ad576fd64aa71bb31c87b58f999653f23e72')
license=('GPL')
url="https://github.com/danielrmeyer/g2"
options=('staticlibs')

build() {
  cd $pkgname-$pkgver
  patch -p1 < "$srcdir"/$pkgname-$pkgver.patch
  ./configure --prefix=/usr CFLAGS="-fPIC"
  make libg2.so libg2.a
}

package() {
  cd $pkgname-$pkgver
  make LIBDIR="$pkgdir"/usr/lib INCDIR="$pkgdir"/usr/include install 
  install -Dm755 libg2.so.0.$pkgver "$pkgdir"/usr/lib/libg2.so.0.$pkgver
  install -Dm755 libg2.a "$pkgdir"/usr/lib/libg2.a
  cd "$pkgdir"/usr/lib
  ln -s libg2.so.0.$pkgver libg2.so.0
}
