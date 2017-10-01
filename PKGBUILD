# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.21
pkgrel=1
pkgdesc="Extracts metadata about the HEAD of a repository"
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F${pkgver}/${pkgname}-${pkgver}.tgz{,.sig})
sha512sums=('a7416e2a6fc6287cfa4c2ae1c542a0727c3856a738027c6529210aecd1beaf70b5ac5122ecc03f14743cd1f361d194af4ff084c4b707bc5e690cd7193fb85292'
            'SKIP')
validpgpkeys=('A16E4FE1BFE882DE9D6E28AD0044B6E72C414317')

build() {
  cd "$pkgname-${pkgver}"

  make VERS=$pkgver
  fmt < COPYING.md > COPYING
}

package() {
  cd "$pkgname-${pkgver}"

  make DESTDIR="${pkgdir}" prefix=/usr install
  install -dm 755 "${pkgdir}"/usr/share/licenses/autorevision
  install -m 444 COPYING "${pkgdir}"/usr/share/licenses/autorevision
}
