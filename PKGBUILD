# Contributor:: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Artem Sheremet <dot.doom@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bmkdep
pkgver=20140112
pkgrel=3
pkgdesc="NetBSD mkdep: construct Makefile dependency list"
arch=('i686' 'x86_64')
makedepends=('bmake')
url="https://code.google.com/p/bmkdep"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trociny/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b80039dc18ec070886e21e3c1ea4a16fc60c239bb922add8c70838d982598635')

prepare() {
  cd $pkgname-$pkgver

  msg2 'Fixing Makefile...'
  sed -i 's/MANDIR=/MANDIR?=/' Makefile
}

build() {
  cd $pkgname-$pkgver

  msg2 'Building...'
  PREFIX=/usr bmake
}

package() {
  cd $pkgname-$pkgver

  msg2 'Installing...'
  install -dm 755 "$pkgdir"/usr/bin
  install -dm 755 "$pkgdir"/usr/share/man/cat1
  PREFIX="$pkgdir/usr" MANDIR="$pkgdir"/usr/share/man bmake install

  install -dm 755 "$pkgdir"/usr/share/licenses/$pkgname
  head -n30 mkdep.c >"$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
