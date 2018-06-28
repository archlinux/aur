# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_pipebang
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="A ppx rewriter that inlines reverse application operators \`|>\` and \`|!\`"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_pipebang"
license=('Apache')
depends=('ocaml' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_pipebang-v${pkgver}.tar.gz")
md5sums=('8f41bb8e67167d04b82223d024008683')

build() {
  cd "${srcdir}/ppx_pipebang-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_pipebang-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
