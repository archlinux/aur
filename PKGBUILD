# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_optional
pkgver=0.11.0
pkgrel=1
pkgdesc="Pattern matching on flat options"
arch=('x86_64')
url='https://github.com/janestreet/ppx_optional'
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_optional-v${pkgver}.tar.gz")
md5sums=('27bcae8445af584299876bdab0288152')

build() {
  cd "${srcdir}/ppx_optional-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/ppx_optional-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
