# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-textutils
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Text output utilities"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/textutils"
license=('Apache')
depends=('ocaml' 'ocaml-core' 'ocaml-ppx_jane' 'ocaml-textutils_kernel' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/textutils-v${pkgver}.tar.gz")
md5sums=('58aede37fcd2e99d90726b30ee36bf1e')

build() {
  cd "${srcdir}/textutils-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/textutils-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share/"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
