# Maintainer: Stefan Husmann <stefan dot husmann at t minus online dot de>

pkgname=svg2png
pkgver=0.1.3
pkgrel=7
pkgdesc="Conversion of SVGs to PNGs via cairo"
url="http://cairographics.org/"
license=('custom')
depends=('libsvg-cairo')
arch=('i686' 'x86_64')
source=("http://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz")
md5sums=('ba266c00486ffd93b8a46d59028aaef9')

build() {
  cd $srcdir/$pkgname-$pkgver
  unset LDFLAGS
  ./configure --prefix=/usr --mandir=/usr/share/man
  sed -i "s/-Wl,--as-needed//g" src/Makefile 
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man install
  install -Dm644 COPYING \
    $pkgdir/usr/share/licenses/$pkgname/COPYING
}
