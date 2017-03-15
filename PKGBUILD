# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.11.2
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex-devel' 'imagemagick' 'python' 'ttf-liberation')
source=(https://github.com/$pkgbase/$pkgbase/archive/v$pkgver.tar.gz
        https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/v$pkgver.tar.gz.asc)
sha512sums=('4c46aaebedf5a084595b1e4081d273855366c8a6a71dc7bd1fad40844e12b2a822de2ee45b74450256f8aa999cc5cc18009653a55d13c0077b9e53cd7ae9da3c'
            'SKIP')
validpgpkeys=('99459CE2770037FF5566EB4B8649B37607A08042')

build() {
  cd "$pkgbase-$pkgver"

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
