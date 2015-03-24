# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.12
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F${pkgver}/autorevision-${pkgver}.tgz)
sha256sums=('d7f44ea446e2b737cc47792d13021e9e52d4fcfca52e2ddc4d8968eada3bf6dc')

build() {
  cd "$srcdir/$pkgname-${pkgver}"

  make VERS=$pkgver
  fmt < COPYING.md > COPYING
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  make DESTDIR="${pkgdir}" prefix=/usr install
  install -dm 755 "${pkgdir}"/usr/share/licenses/autorevision
  install -m 444 COPYING "${pkgdir}"/usr/share/licenses/autorevision
}

# vim:set ts=2 sw=2 et:
