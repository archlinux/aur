# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless
# Contributor: jiornojiovanni <gianni00palmieri at gmail dot com>

## GPG key: https://github.com/hexdecimal.gpg

pkgname=libtcod
pkgver=1.21.0
pkgrel=1
pkgdesc="Roguelike graphics/utility library"
arch=('x86_64')
url="https://github.com/libtcod/libtcod"
license=('BSD')
depends=('sdl2')
makedepends=('git' 'python')
provides=("$pkgname.so")
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('9EF1E80F3817BC043097A7C15814977902B194CC') ## HexDecimal

build() {
  cd "$pkgname/buildsys/autotools"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname/buildsys/autotools"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
