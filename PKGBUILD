# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_tools_versioned
pkgver=5.2
pkgrel=1
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools (with ocaml-migrate-parsetree support)"
arch=('x86_64')
license=('MIT')
url="https://github.com/ocaml-ppx/ppx_tools_versioned"
depends=('ocaml' 'ocaml-migrate-parsetree')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/ppx_tools_versioned/archive/${pkgver}.tar.gz")
md5sums=('f2f1a1cd11aeb9f91a92ab691720a401')

build() {
  cd "${srcdir}/ppx_tools_versioned-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_tools_versioned-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
