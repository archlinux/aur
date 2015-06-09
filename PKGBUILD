# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Artem Sheremet <dot.doom@gmail.com>

pkgname=bmkdep
pkgver=20140112
pkgrel=1
pkgdesc="NetBSD mkdep: construct Makefile dependency list"
arch=('i686' 'x86_64')
makedepends=('bmake')
url="https://code.google.com/p/bmkdep"
license=('BSD')
source=(https://bmkdep.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha256sums=('393aafe3d42eee6f055741268904d4f6da82700394eb4b942f3015c8c36f674c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Fixing Makefile...'
  sed -i 's/MANDIR=/MANDIR?=/' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  PREFIX=/usr bmake
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/man/cat1"
  PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" bmake install

  install -dm 755 "$pkgdir/usr/share/licenses/$pkgname"
  head -n30 mkdep.c >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
