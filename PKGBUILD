# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Artem Sheremet <dot.doom@gmail.com>

pkgname=bmkdep
pkgver=20140112
pkgrel=2
pkgdesc="NetBSD mkdep: construct Makefile dependency list"
arch=('i686' 'x86_64')
makedepends=('bmake')
url="https://code.google.com/p/bmkdep"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/trociny/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('0e63b2e1aa6086e0c928197cc68c66dc180894f18abb159d84e6fe40a259c27f')

prepare() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Fixing Makefile...'
  sed -i 's/MANDIR=/MANDIR?=/' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Building...'
  PREFIX=/usr bmake
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/man/cat1"
  PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" bmake install

  install -dm 755 "$pkgdir/usr/share/licenses/$pkgname"
  head -n30 mkdep.c >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
