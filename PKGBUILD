# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: cs-cam <me.at.camdaniel.com>

_commit=cc7f1b5a1220b3a3ffe356e056e6627c64bdf122
pkgname=otf2bdf
pkgver=3.1
pkgrel=3
pkgdesc="A command-line OpenType to BDF font converter"
arch=('i686' 'x86_64')
url="https://github.com/jirutka/otf2bdf/"
license=('custom')
depends=('freetype2')
source=("https://github.com/jirutka/otf2bdf/archive/$_commit/$pkgname-$pkgver.tar.gz")
sha256sums=('6f33ae2734ae48258201ce967a0b23cd88e901348591ee978e8250986781bcb4')

prepare() {
  cd "${srcdir}/${pkgname}-${_commit}"
  sed -r 's/freetype-config (--[a-z]+)/pkg-config \1 freetype2/' -i configure
}

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install man page and license
  sed -n "1,21p" README > COPYING
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 ${pkgname}.man "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
