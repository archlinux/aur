# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=ink
pkgver=0.5.3
pkgrel=2
pkgdesc="Command line tool for checking the ink level of printers"
arch=('i686' 'x86_64')
url="http://ink.sourceforge.net/"
license=('GPL2')
depends=('libinklevel')
source=(http://downloads.sourceforge.net/ink/ink-$pkgver.tar.gz
        fix-malloc-compilation.patch)
sha256sums=('2d318fb6a826ef3a2c7cd1e889f42971fd7ae682e3e0ba471c8a0016375a60ba'
            'e1195fcff8ae2bdf7a7e84b47e1438af11b8652f238a6ce7b839f29399c69b57')

prepare() {
  cd "$srcdir/ink-$pkgver"
  patch -p1 -i "$srcdir/fix-malloc-compilation.patch"
}


build() {
  cd "$srcdir/ink-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ink-$pkgver"
  make DESTDIR=$pkgdir install
}
