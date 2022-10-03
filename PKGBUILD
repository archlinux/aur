# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_bench
pkgver=0.15.0
pkgrel=1
epoch=1
pkgdesc="A micro-benchmarking library for ocaml"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_bench"
license=('Apache')
depends=('ocaml' 'ocaml-core' 'ocaml-core_unix' 'ocaml-ppx_compare' 'ocaml-ppx_fields_conv' 'ocaml-core_extended' 'ocaml-ppx_jane' 'ocaml-ppx_let' 'ocaml-ppx_sexp_conv' 'ocaml-textutils' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-re')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/core_bench-v${pkgver}.tar.gz")
md5sums=('622be5cb12b8091c764caca053e1d368')

build() {
  cd "${srcdir}/core_bench-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/core_bench-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
