# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=cgterm
pkgver=1.6
pkgrel=2
pkgdesc="C/G telnet client that lets you connect to C64 telnet BBS"
arch=('i686' 'x86_64')
url="http://www.paradroid.net/cgterm/"
license=('custom:cgterm')
depends=('sdl')
source=( http://www.paradroid.net/$pkgname/$pkgname-$pkgver.tar.gz
  LICENSE)
md5sums=('5b8f81ea8a2c0612d2998f05fd87ec40'
         'f616779bd95231a09e3eab03e2f0d3c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i -e 's/^PREFIX=.*$/PREFIX=\/usr/g' -e 's/-O3 -Wall /-O3 /g' -e 's/mkdir \$(PREFIX)/mkdir -p \$(PREFIX)/g' Makefile

  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="${pkgdir}/usr" install || return 1
  rmdir $pkgdir/usr/etc || return 1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname || return 1
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/ || return 1
}

# vim:set ts=2 sw=2 et:
