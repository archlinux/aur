# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.9
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="http://www.catb.org/~esr/autorevision/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F${pkgver}/autorevision-${pkgver}.tgz)
sha256sums=('b76eff2ff9701d988721367c12a7045944c82ca342754f65caa4f7dea8e91d62')

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
