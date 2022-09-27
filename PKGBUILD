# Maintainer: Chris Berkhout <chris@chrisberkhout.com>
pkgname=pgn-extract
pkgver=22.11
pkgrel=1
pkgdesc="A Portable Game Notation (PGN) Manipulator for Chess Games"
arch=('x86_64')
url="https://www.cs.kent.ac.uk/people/staff/djb/pgn-extract/"
license=('GPL3')
depends=('glibc')
source=("https://www.cs.kent.ac.uk/~djb/pgn-extract/pgn-extract-${pkgver//\./-}.tgz")
sha256sums=('331e84d55299987dc27f159292ea3b59b94c47edc972f32e96f4e6c0c8621c0b')

build() {
  cd "$srcdir/$pkgname"

  make
}

check() {
  cd "$srcdir/$pkgname/test"

  ./runtests
  make -k all
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 755 pgn-extract "$pkgdir/usr/bin/pgn-extract"
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/$pkgname/"
  cp *.{pgn,html,css,xml} "$pkgdir/usr/share/$pkgname/"
}
