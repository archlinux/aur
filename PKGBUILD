# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-re2
pkgver=0.15.0
pkgrel=1
epoch=1
pkgdesc="OCaml bindings for RE2, Google's regular expression library"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/re2"
license=('Apache')
depends=('ocaml' 'ocaml-core_kernel' 'ocaml-ppx_jane' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/re2-v${pkgver}.tar.gz")
md5sums=('e830749c8a99af15285255228eb94521')

build() {
  cd "${srcdir}/re2-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/re2-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
