# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-zed
pkgver=1.6
pkgrel=1
pkgdesc="An abstract engine for text editing"
arch=('i686' 'x86_64')
url='https://github.com/diml/zed'
license=('BSD')
depends=('ocaml' 'ocaml-camomile' 'ocaml-react')
makedepends=('dune')
options=('!strip')
source=("https://github.com/diml/zed/archive/${pkgver}.tar.gz")
md5sums=('db050d98f4b7051530e023a5e2c4f438')

build() {
  cd "${srcdir}/zed-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/zed-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
