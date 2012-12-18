# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=autorevision
pkgver=1.3
pkgrel=1
pkgdesc="Extracts metadata about the head of a repository; useful for build scripts."
arch=('any')
url="http://www.catb.org/~esr/autorevision/"
license=('BSD')
depends=('bash')
makedepends=('asciidoc' 'markdown')
source=(http://www.catb.org/~esr/autorevision/autorevision-$pkgver.tgz)
sha256sums=('3df0104f217cce3c14c1d0d29d31fd1969966637a93005d6f679328f43ae2bd0')

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
  install -m 644 *.html *.css ${pkgdir}/usr/share/doc/autorevision

  install -Dm 644 COPYING.md ${pkgdir}/usr/share/licenses/autorevision/COPYING
}

# vim:set ts=2 sw=2 et:
