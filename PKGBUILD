# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=0.3
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
url="http://www.catb.org/esr/cvs-fast-export/"
license=('GPL2')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('fdbbbd8a267c9f6fceecb41a1875d99fd2fef9d31c2ab0d131d0b70cec8d18c4')

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
