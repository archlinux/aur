# Maintainer: Chris Berkhout <chris@chrisberkhout.com>
pkgname=pgn-extract
pkgver=25.01
pkgrel=1
pkgdesc="A Portable Game Notation (PGN) Manipulator for Chess Games"
arch=('x86_64')
url="https://www.cs.kent.ac.uk/people/staff/djb/pgn-extract/"
license=('GPL3')
depends=('glibc')
source=("https://www.cs.kent.ac.uk/~djb/pgn-extract/pgn-extract-${pkgver//\./-}.tgz")
sha256sums=('c024a2d64abaedc873bd4e70b19d3ffdbbfa4dd054e6856b4a4262238af10eaa')

build() {
  cd "$srcdir/$pkgname"

  make
}

check() {
  cd "$srcdir/$pkgname/test"

  make -k all
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 755 pgn-extract "$pkgdir/usr/bin/pgn-extract"
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/$pkgname/"
  cp *.{pgn,html,css,xml} "$pkgdir/usr/share/$pkgname/"
}
