# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xforms
pkgver=1.2.5pre1
pkgrel=4
pkgdesc="A graphical user interface toolkit for X Window Systems."
arch=('i686' 'x86_64')
license=('LGPL')
url='http://xforms-toolkit.org/'
depends=('libxpm' 'libjpeg' 'libgl')
source=("http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('52d0358f384db0ebf053dc1ae5f98446b1ae3ad75ebdd4438da8c023acbf9dba')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr 
  make
  cd doc
  make info
  make pdf
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir"/ install
  rm $pkgdir/usr/lib/*.la
  install -d "$pkgdir"/usr/share/info 
  install -m644 doc/$pkgname.info* \
    "$pkgdir"/usr/share/info
  install -Dm644 doc/$pkgname.pdf \
    "$pkgdir"/usr/share/doc/$pkgname/$pkgname.pdf
}
