# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_here
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Expands [%here] into its location"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_here"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_here-v${pkgver}.tar.gz")
sha512sums=('3df1fac265a599e65b23b7d514757b9a1a3f0003616806eb3ca824c95d3809b7588310672bf9a6e124a858d47294db835a846a51bb319f621f28ec2e6b2f4b00')

build() {
  cd "${srcdir}/ppx_here-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_here-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgdir}/LICENSE.md"
}
