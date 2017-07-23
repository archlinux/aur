# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.11.3
pkgrel=2
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex' 'imagemagick' 'python' 'ttf-liberation')
source=(https://github.com/$pkgbase/$pkgbase/archive/v$pkgver.tar.gz
        https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/v$pkgver.tar.gz.asc)
sha512sums=('51e0d5f7ca7c846c556fcba36b0f9c815090bfc76a80200aebd1526291da16b71145fbe254100cc5ad37ffc044d4380ef07b8bd4bdb811f00b9150e7b34dd636'
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
