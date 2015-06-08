# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hp2xx
pkgver=3.4.4
pkgrel=3
pkgdesc="Convert vector-oriented graphics data from HP-GL plotter language into a variety of popular graphics formats."
arch=('i686' 'x86_64')
depends=('libpng' 'libtiff' 'libjpeg' 'libx11')
url="http://www.gnu.org/software/$pkgname/"
license=('GPL')
source=("http://ftpmirror.gnu.org/$pkgname/$pkgname-$pkgver.tar.gz" libpng.patch)
md5sums=('18808580d24b7caf2c4c7045c093329f'
         '22d577c7f10ada9370e06cf095af9ae9')
install=$pkgname.install

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < $srcdir/libpng.patch
  sed -i '95s+\@+ at +' doc/hp2xxinf.tex
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make all
  cd doc
  makeinfo hp2xxinf.tex -o hp2xx.info
}

package () {
  cd $srcdir/$pkgname-$pkgver
  install -d "$pkgdir"/usr/share/{man/man1,info} "$pkgdir"/usr/bin
  make install prefix="$pkgdir/usr" \
       man1dir="$pkgdir/usr/share/man/man1" \
       infodir="$pkgdir/usr/share/info" 
}
