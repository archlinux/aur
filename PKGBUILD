# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: cs-cam <me.at.camdaniel.com>

pkgname=otf2bdf
pkgver=3.1
pkgrel=2
pkgdesc="A command-line OpenType to BDF font converter"
arch=('i686' 'x86_64')
url="http://sofia.nmsu.edu/~mleisher/Software/otf2bdf/"
license=('custom')
depends=('freetype2')
source=("https://github.com/mtorromeo/otf2bdf/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5842a6c604a8aa747f9f49838e3a91ce587c8568681300bc70418aeebd7ecc43')

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
