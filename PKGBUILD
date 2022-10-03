# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-textutils_kernel
pkgver=0.15.0
pkgrel=1
pkgdesc="The subset of textutils using only core_kernel and working in javascript"
arch=('x86_64')
url='https://github.com/janestreet/textutils_kernel'
license=('Apache')
depends=('ocaml' 'ocaml-core' 'ocaml-ppx_jane' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-uutf')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/textutils_kernel-v${pkgver}.tar.gz")
md5sums=('41863cb439a86b6522139a380b114790')

build() {
  cd "${srcdir}/textutils_kernel-v${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/textutils_kernel-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
