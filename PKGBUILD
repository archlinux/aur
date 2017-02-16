# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.11
pkgrel=2
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex-devel' 'imagemagick' 'python' 'ttf-liberation')
source=(https://github.com/$pkgbase/$pkgbase/archive/v$pkgver.tar.gz)
sha256sums=('76b6b9cfb52a78fe8afc89c7f607ff99398755578867c7cf8c18605087b437e3')

build() {
  cd "$pkgbase-$pkgver"

  MAKEFLAGS="-j1" # Workaround a bug.
  make
}

package_freedm() {
  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedm
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_freedoom1() {
  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_freedoom2() {
  provides=('freedoom')

  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom2
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
