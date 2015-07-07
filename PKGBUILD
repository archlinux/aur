# Maintainer: William J. Bowman <bluephoenix47@gmail.com>

pkgname=mathcomp
pkgver=1.5
pkgrel=1
pkgdesc="A mathematical components library for Coq."
url="http://ssr.msr-inria.inria.fr/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq<8.5' 'ssreflect=1.5') # 'coq>=8.4'
makedepends=('camlp5-transitional>=6.12')
source=(http://ssr.msr-inria.inria.fr/FTP/mathcomp-1.5.tar.gz)
sha256sums=('55ad520996541dd2d76c2ed24d7b74b64091158d586fd43ccd74a110f9d62789')
sha512sums=('2cd6b6e21a8edf1e6d15edff718bf1c1848e4f97c1b2c8eea075c9c1658d98732d18fc2dc04ba5ff40a5c21dc1a618d2d6d62fd10f29ffb94776641e3e98c089')

build() {
  cd $srcdir/$pkgname-$pkgver

  # mathcomp requires *a lot* of memory to build. It can be a good
  # idea add -j1 to the following command to force a sequential build.
  make
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir 'COQLIB:=$(DESTDIR)/$(shell coqtop -where)/' install
}

