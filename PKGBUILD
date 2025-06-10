# Maintainer: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: dalz <dalz @t disroot d0t org>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=guile-ncurses
pkgver=3.1
pkgrel=3
pkgdesc='Guile bindings for the ncurses library'
arch=('x86_64')
license=('LGPL-3.0-or-later')
depends=('guile' 'ncurses')
url='http://www.gnu.org/software/guile-ncurses/'
source=(http://ftpmirror.gnu.org/$pkgname/$pkgname-$pkgver.tar.gz{,.sig}
  item-store.patch)
sha256sums=('ee89e8ceafcab9dd0ef3fc1acc9b10f4d21ba4b256d329d842d6183e63f8d733'
            'SKIP'
            '93853372107aadfb935f53434770c147ae8b70feb7ba34837bae1969e008f162')
validpgpkeys=('7C378E20D1561BC9E9CB3A5454ADD17A8A1F7454') # Michael Gran <spk121@yahoo.com>

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np2 -i ../item-store.patch
}
build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
