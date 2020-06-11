# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-re2
pkgver=0.14.0
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
md5sums=('1ba423969e51a6a226d19f4cbb898719')

build() {
  cd "${srcdir}/re2-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/re2-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
