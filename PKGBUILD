# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.11.1
pkgrel=2
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex-devel' 'imagemagick' 'python' 'ttf-liberation')
source=(https://github.com/$pkgbase/$pkgbase/archive/v$pkgver.tar.gz
        https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/v$pkgver.tar.gz.asc)
sha512sums=('bc0882bdf6c3fe4b61b2a4deb67c76d91de4a3781e37cc6baf66fd565a722c5359a9608afe7780592ba0814bcd63518371e7e7e3d8f0e3ed4654b761a2ec8313'
            'SKIP')
validpgpkeys=('99459CE2770037FF5566EB4B8649B37607A08042')

build() {
  cd "$pkgbase-$pkgver"

  MAKEFLAGS="-j1" # Workaround a bug.
  make
}

package_freedm() {
  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedm
  install -Dm644 COPYING.adoc "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_freedoom1() {
  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom1
  install -Dm644 COPYING.adoc "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_freedoom2() {
  provides=('freedoom')

  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom2
  install -Dm644 COPYING.adoc "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
