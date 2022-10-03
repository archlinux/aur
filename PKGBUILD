# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-textutils
pkgver=0.15.0
pkgrel=1
epoch=1
pkgdesc="Text output utilities"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/textutils"
license=('Apache')
depends=('ocaml' 'ocaml-core' 'ocaml-core_unix'  'ocaml-ppx_jane' 'ocaml-textutils_kernel' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-uutf')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/textutils-v${pkgver}.tar.gz")
sha256sums=('c0368fb6ad18727cd69fbfb20dd734fb7f7189707107d1f88d8de15837dc22df')

build() {
  cd "${srcdir}/textutils-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/textutils-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share/"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
