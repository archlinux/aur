# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core
pkgver=0.11.1
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
md5sums=('93ee333a0027bcda7cca3b323171d13b')

build() {
  cd "${srcdir}/core-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/core-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/lib/ocaml/stubslibs" "${pkgdir}/usr/lib/ocaml/stublibs" # bug in opam
}
