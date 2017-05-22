# Maintainer: Jan Holthuis <holthuis dot jan at gmail dot com>
pkgname=latex-rail
pkgver=1.2.1
pkgrel=2
pkgdesc="A C program and LaTeX packkage to draw syntax diagrams specified in EBNF."
arch=('x86' 'x86_64')
url="http://www.ctan.org/tex-archive/support/rail"
license=('unknown')
depends=('texlive-core')
makedepends=('bison' 'flex')
source=("https://github.com/Holzhaus/$pkgname/archive/v$pkgver.tar.gz")
install="$pkgname.install"
sha512sums=('0dfa3af25b152395a398271c06e880db76567ea542720646e793c148bc70c657100538696e1228d7eff8b416e9c5478b8ba2228b6754ac1b5458af96313c2d0e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
  make doc
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr" DESTDIR="$pkgdir" install

  # Documentation
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 README2e "$pkgdir/usr/share/doc/$pkgname/README2e"
  install -Dm644 rail.pdf "$pkgdir/usr/share/doc/$pkgname/rail.pdf"
  install -Dm644 rail.txt "$pkgdir/usr/share/doc/$pkgname/rail.txt"
}
