# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname=itex2mml
pkgver=1.5.1
pkgrel=1
pkgdesc="tex to MathML converter"
arch=('i686' 'x86_64')
url="http://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
depends=('gcc-libs')
license=('GPL' 'MPL')
source=($pkgname-$pkgver.tar.gz::http://golem.ph.utexas.edu/~distler/blog/files/itexToMML.tar.gz
	bison3-fix.patch)
md5sums=('409f4b2f9f9ec1baeff811feb1b3a4e7'
         '7c82a3de132e5662726c2aea384c2814')

prepare() {
  cd $srcdir/itexToMML/itex-src
  sed -i "s|/usr/local/bin|$pkgdir/usr/bin|" Makefile
  patch -p2 <$srcdir/bison3-fix.patch
}

build() {
  cd $srcdir/itexToMML/itex-src
  make
}

package() {
  cd $srcdir/itexToMML/itex-src
  install -d $pkgdir/usr/bin
  make DESTDIR=$pkgdir/ install
}
