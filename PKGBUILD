# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_fail
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Add location to calls to failwiths"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_fail"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_here' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_fail-v${pkgver}.tar.gz")
md5sums=('b153a48e619b819a89924857586e76ac')

build() {
  cd "${srcdir}/ppx_fail-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_fail-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
