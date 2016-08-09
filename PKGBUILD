# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.15
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/archive/v/${pkgver}.tar.gz)
sha256sums=('54fb0d20ac67bc77ffc1c6bb9580da7dd401985c1c9f701b9ced370e5efce218')

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
