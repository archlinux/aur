# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: cs-cam <me.at.camdaniel.com>

pkgname=otf2bdf
pkgver=3.1
pkgrel=1
pkgdesc="A command-line OpenType to BDF font converter"
arch=('i686' 'x86_64')
url="http://sofia.nmsu.edu/~mleisher/Software/otf2bdf/"
license=('custom')
depends=('freetype2')
source=("http://sofia.nmsu.edu/~mleisher/Software/otf2bdf/${pkgname}-${pkgver}.tbz2")
md5sums=('6af09173615f1dd5ae294bbf67ac52c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install man page and license
  sed -n "1,21p" README > COPYING
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 ${pkgname}.man "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
