# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppxlib
pkgver=0.3.0
pkgrel=1
pkgdesc="Base library and tools for ppx rewriters"
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppxlib'
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-compiler-libs-repackaged' 'ocaml-migrate-parsetree' 'ocaml-ppx_derivers' 'ocaml-stdio')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/ppxlib/archive/${pkgver}.tar.gz")
md5sums=('e6ff83b1643a44fcb6b0acde4d2aa299')

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
