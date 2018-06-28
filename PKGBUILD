# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_bin_prot
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="Generation of bin_prot readers and writers from types"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_bin_prot"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-bin_prot' 'ocaml-ppx_here' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_bin_prot/archive/v${pkgver}.tar.gz")
md5sums=('fae0a476df94eb1dc7fccb293adffe1f')

build() {
  cd "${srcdir}/ppx_bin_prot-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_bin_prot-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
