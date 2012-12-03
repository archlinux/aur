# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.2
pkgrel=2
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="http://www.catb.org/~esr/autorevision/"
license=('BSD')
makedepends=('asciidoc' 'markdown')
source=(http://www.catb.org/~esr/autorevision/autorevision-$pkgver.tgz)
sha256sums=('0d4cb0e9313ada937e7ef643e4200f01f2b29282cc30d3188391ac7f339d5f6e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make VERS=1.2 autorevision.1
  make VERS=1.2 {autorevision,CONTRIBUTING,COPYING,README}.html
  gzip autorevision.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm 755 ${pkgdir}/usr/bin
  install -dm 755 ${pkgdir}/usr/share/man/man1
  install -m 755 autorevision ${pkgdir}/usr/bin/autorevision
  install -m 644 autorevision.1.gz ${pkgdir}/usr/share/man/man1
  install -dm 755 ${pkgdir}/usr/share/doc/autorevision
  install -m 644 *.html *.css ${pkgdir}/usr/share/doc/autorevision
}

# vim:set ts=2 sw=2 et:
