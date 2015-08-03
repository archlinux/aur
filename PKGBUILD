# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.13
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="https://autorevision.github.io/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F${pkgver}/autorevision-${pkgver}.tgz)
sha256sums=('b2a5cd0e368b585f4e6a9414d632194b0de715185404f8cbe21645660fbcbcdf')

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
