# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_extended
pkgver=0.11.0
pkgrel=2
epoch=1
pkgdesc="Extra components that are not as closely vetted or as stable as Core"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_extended"
license=('Apache')
depends=('ocaml' 'ocaml-bin_prot' 'ocaml-core' 'ocaml-core_kernel' 'ocaml-fieldslib' 'ocaml-ppx_jane' 'ocaml-re2' 'ocaml-sexplib' 'ocaml-textutils' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-re')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/core_extended-v${pkgver}.tar.gz")
md5sums=('a76585ff35d46116ddc7d9f0db875b58')

build() {
  cd "${srcdir}/core_extended-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/core_extended-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
