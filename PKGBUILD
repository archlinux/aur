# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.11.1
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex-devel' 'imagemagick' 'python' 'ttf-liberation')
source=(https://github.com/$pkgbase/$pkgbase/archive/v$pkgver.tar.gz)
sha256sums=('fb4e10d3f00c68981c3fc6aa6ef0528c6a25359d0231c37d3a20bad4eec50d18')

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
