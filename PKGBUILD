# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.18
pkgrel=1
pkgdesc="Extracts metadata about the HEAD of a repository"
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/archive/v/${pkgver}.tar.gz)
sha256sums=('a213e1bbab39c84c4832a70b8980473a547923bfe75135459d686226a0cd33f3')

build() {
  cd "$pkgname-v-${pkgver}"

  make VERS=$pkgver
  fmt < COPYING.md > COPYING
}

package() {
  cd "$pkgname-v-${pkgver}"

  make DESTDIR="${pkgdir}" prefix=/usr install
  install -dm 755 "${pkgdir}"/usr/share/licenses/autorevision
  install -m 444 COPYING "${pkgdir}"/usr/share/licenses/autorevision
}
