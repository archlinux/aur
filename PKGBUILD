# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-mailx-cvs
pkgver=2011.06.22
pkgrel=1
pkgdesc="A mail user agent for Unix systems."
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/mailx.html"
license=('Custom:BSD')
provides=()
depends=('heirloom-cvs')
makedepends=('cvs')
source=('Makefile.patch')
md5sums=('32b97d276c08da4945ec79bb1fbce5ec')
sha1sums=('2de1b2479aea2d8bf48ed9270fd030749b84afb9')
sha256sums=('a03fec52ebfcb072e7839e253ef5b897f10f2afafe524d3bc3166d8875e48d5e')

prepare() {
cd $srcdir
  cvs -d:pserver:anonymous:@nail.cvs.sourceforge.net:/cvsroot/nail login
  cvs -d:pserver:anonymous:@nail.cvs.sourceforge.net:/cvsroot/nail co nail
  rm -rf $srcdir/build
  cp -ar $srcdir/nail $srcdir/build
  cd $srcdir/build
  patch -p0 $srcdir/build/Makefile -i $srcdir/Makefile.patch
}

build() {
  cd $srcdir/build
  make
}

package() {
  cd $srcdir/build
  make DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/nail/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

