# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=0.7
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
makedepends=('asciidoc')
url="http://www.catb.org/esr/cvs-fast-export/"
license=('GPL2')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('4faaf7f6b6323f6dca3026fcf9eb94ebd24f80c892b09e73919589c4c561ac80')

build() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr $pkgname{,.1,.html}
  asciidoc README
}

package() {
  cd ${pkgname}-${pkgver}

  # Grumble about "make install" targets that don't work...
  install -dm 755 ${pkgdir}/usr/bin
  install -dm 755 ${pkgdir}/usr/share/doc/cvs-fast-export
  install -dm 755 ${pkgdir}/usr/share/man/man1
  install -m 755 ${pkgname} ${pkgdir}/usr/bin
  install -m 644 *.html AUTHORS NEWS ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1
}

# vim:set ts=2 sw=2 et:
