# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.8
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="http://www.catb.org/~esr/autorevision/"
license=('BSD')
makedepends=('asciidoc')
source=(http://www.catb.org/~esr/autorevision/autorevision-$pkgver.tgz)
sha256sums=('fd5a82fe1017119bd277aca74ded6ef899baf636a5c1277c2cd4e12ffce8c90c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make VERS=$pkgver
  fmt < COPYING.md > COPYING
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}" prefix=/usr install
  install -dm 755 "${pkgdir}"/usr/share/licenses/autorevision
  install -m 444 COPYING "${pkgdir}"/usr/share/licenses/autorevision
}

# vim:set ts=2 sw=2 et:
