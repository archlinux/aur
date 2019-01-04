# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core
pkgver=0.11.3
pkgrel=1
epoch=1
pkgdesc="Industrial strength alternative to OCaml's standard library"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-configurator' 'ocaml-core_kernel' 'ocaml-ppx_assert' 'ocaml-ppx_jane' 'ocaml-sexplib' 'ocaml-spawn' 'ocaml-stdio' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
optdepends=('ocaml-utop: for coretop support'
            'ocamlbuild: for corebuild support')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/core/releases/download/v${pkgver}/core-v${pkgver}.tbz")
sha512sums=('ac0846b4012d489a6b5222a37f5a3ab910ff35635896beeacc1c2d100639495756dddf2d7b71b86f1e51915790ccc4c79d049c1d4ebefdae406414dd376c15df')

build() {
  cd "${srcdir}/core-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/core-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
