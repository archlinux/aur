# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xforms
pkgver=1.2.5pre1
pkgrel=5
pkgdesc="A graphical user interface toolkit for X Window Systems."
arch=('i686' 'x86_64')
license=('LGPL')
url='http://xforms-toolkit.org/'
depends=('libxpm' 'libjpeg' 'libgl')
makedepends=('git')
source=("git+https://git.savannah.gnu.org/git/xforms.git#commit=2c1a9f151baf50887a517280645ec23379fb96f8")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr 
  make 
  cd doc
  make info
  make pdf
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir"/ install
  rm $pkgdir/usr/lib/*.la
  install -d "$pkgdir"/usr/share/info 
  install -m644 doc/$pkgname.info* \
    "$pkgdir"/usr/share/info
  install -Dm644 doc/$pkgname.pdf \
    "$pkgdir"/usr/share/doc/$pkgname/$pkgname.pdf
}
