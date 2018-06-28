# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_variants_conv
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="Generation of accessor and iteration functions for ocaml variant types"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_variants_conv"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-variantslib' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_variants_conv/archive/v${pkgver}.tar.gz")
md5sums=('146b49b84315b7d67c1ca758fcbf2fb2')

build() {
  cd "${srcdir}/ppx_variants_conv-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_variants_conv-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
