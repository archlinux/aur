# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.18
pkgrel=2
pkgdesc="Extracts metadata about the HEAD of a repository"
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F1.18/${pkgname}-${pkgver}.tgz{,.sig})
sha256sums=('1f78dd8e9671fa00d96d2d4479235950d8d8637f59bc38b1b622638cf0225e87'
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
