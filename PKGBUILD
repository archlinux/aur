# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.10+a
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="http://www.catb.org/~esr/autorevision/"
license=('BSD')
makedepends=('asciidoc')
source=(https://github.com/Autorevision/autorevision/releases/download/v%2F${pkgver/+a/a}/autorevision-${pkgver/+a/a}.tgz)
sha256sums=('1991c14d955d44c29b4a88e97a3ea042c829c768643fdd3ba22b7b8a64fff41e')

build() {
  cd "$srcdir/$pkgname-${pkgver/+a/a}"

  make VERS=$pkgver
  fmt < COPYING.md > COPYING
}

package() {
  cd "$srcdir/$pkgname-${pkgver/+a/a}"

  make DESTDIR="${pkgdir}" prefix=/usr install
  install -dm 755 "${pkgdir}"/usr/share/licenses/autorevision
  install -m 444 COPYING "${pkgdir}"/usr/share/licenses/autorevision
}

# vim:set ts=2 sw=2 et:
