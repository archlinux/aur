# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.20
pkgrel=1
pkgdesc="Extracts metadata about the HEAD of a repository"
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F${pkgver}/${pkgname}-${pkgver}.tgz{,.sig})
sha256sums=('1ed2ff8614c365384a8de435931bafce4417b538222a44d0cd27ec2d2c3f97f6'
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
