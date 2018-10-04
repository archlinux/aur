# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppxlib
pkgver=0.3.1
pkgrel=1
pkgdesc="Base library and tools for ppx rewriters"
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppxlib'
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-compiler-libs-repackaged' 'ocaml-migrate-parsetree' 'ocaml-ppx_derivers' 'ocaml-stdio')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/ppxlib/releases/download/${pkgver}/ppxlib-${pkgver}.tbz")
sha512sums=('6fd5fd40a427582d30b83ed5dac8312f442081a52a454b5edd0c6e5f4bc735f3cd5c0712a9f9ad5dacfac5bb8646403baf350f79d2dcb5ad2041282f5b9643a6')

build() {
  cd "${srcdir}/ppxlib-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/ppxlib-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
