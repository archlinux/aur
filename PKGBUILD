# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xforms
pkgver=1.2.4
pkgrel=1
pkgdesc="A graphical user interface toolkit for X Window Systems."
arch=('i686' 'x86_64')
license=('LGPL')
url='http://xforms-toolkit.org/'
depends=('libxpm' 'libjpeg' 'libgl')
makedepends=('texlive-plainextra')
source=(http://download.savannah.gnu.org/releases/xforms/$pkgname-$pkgver.tar.gz)
md5sums=('d4414c9eb3b284aa2f603a49f376ed22')
install=$pkgname.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make
  cd doc
  make info
  make pdf
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
  rm $pkgdir/usr/lib/*.la
  install -d $pkgdir/usr/share/info 
  install -m644 $srcdir/$pkgname-$pkgver/doc/$pkgname.info* \
    $pkgdir/usr/share/info
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/$pkgname.pdf \
    $pkgdir/usr/share/doc/$pkgname/$pkgname.pdf
}
