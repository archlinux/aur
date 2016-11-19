# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.17
pkgrel=1
pkgdesc="Extracts metadata about the HEAD of a repository"
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/archive/v/${pkgver}.tar.gz)
sha256sums=('cb1194f08ead4ed703bbdf97ceb650ee4528dab34034ecc2a2c100c3383d2c27')

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
