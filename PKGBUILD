# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppxlib
pkgver=0.6.0
pkgrel=1
pkgdesc="Base library and tools for ppx rewriters"
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppxlib'
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-compiler-libs-repackaged' 'ocaml-migrate-parsetree' 'ocaml-ppx_derivers' 'ocaml-stdio')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/ppxlib/releases/download/${pkgver}/ppxlib-${pkgver}.tbz")
sha512sums=('dcb92285a4822499f66d86947cfcae25bbdbfec0df7c861c08cdcfe7b958dcb0ad6b42ca7737436150d0eebbaccc62d742fb37fc81c66c81e1d88b127654a06c')

build() {
  cd "${srcdir}/ppxlib-${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/ppxlib-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
