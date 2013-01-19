# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.4
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="http://www.catb.org/~esr/autorevision/"
license=('BSD')
depends=('bash')
makedepends=('asciidoc' 'markdown')
source=(http://www.catb.org/~esr/autorevision/autorevision-$pkgver.tgz)
sha256sums=('b573160aea1e46c9d0f67290e6a3faf8c8f9fbc71d7222ca1af54bb9ea39fc35')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make VERS=$pkgver autorevision.1
  make VERS=$pkgver {autorevision,CONTRIBUTING,COPYING,README}.html
  gzip autorevision.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm 755 ${pkgdir}/usr/bin
  install -dm 755 ${pkgdir}/usr/share/man/man1
  install -m 755 autorevision ${pkgdir}/usr/bin/autorevision
  install -m 644 autorevision.1.gz ${pkgdir}/usr/share/man/man1
  install -dm 755 ${pkgdir}/usr/share/doc/autorevision
  install -m 644 NEWS *.html *.css ${pkgdir}/usr/share/doc/autorevision

  install -Dm 644 COPYING.md ${pkgdir}/usr/share/licenses/autorevision/COPYING
}

# vim:set ts=2 sw=2 et:
