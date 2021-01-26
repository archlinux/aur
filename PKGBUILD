# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.22
pkgrel=1
pkgdesc="Extracts metadata about the HEAD of a repository"
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F${pkgver}/${pkgname}-${pkgver}.tgz{,.sig})
b2sums=('f3b6fb3d0360c5b1e8f2be14f4b6e10ab8ab4445a87c2a737092b4df7ea4b3e3c47943ea3394df879675f6afc1cf33375fc2dd312de7250e65e0ffc94dde303e'
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
