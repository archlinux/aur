# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-lambda-term
pkgver=1.13
pkgrel=1
pkgdesc='A cross-platform library for manipulating the terminal'
arch=('i686' 'x86_64')
url='https://github.com/diml/lambda-term'
license=('BSD')
depends=('ocaml' 'ocaml-lwt' 'ocaml-lwt_log' 'ocaml-react' 'ocaml-zed' 'ocaml-camomile')
makedepends=('dune')
source=("https://github.com/diml/lambda-term/releases/download/${pkgver}/lambda-term-${pkgver}.tbz")
options=('!strip')
md5sums=('c13826a97014d4d573b927b623c7e043')

build() {
  cd "${srcdir}/lambda-term-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/lambda-term-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
