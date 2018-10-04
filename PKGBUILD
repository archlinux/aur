# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_tools_versioned
pkgver=5.2.1
pkgrel=1
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools (with ocaml-migrate-parsetree support)"
arch=('x86_64')
license=('MIT')
url="https://github.com/ocaml-ppx/ppx_tools_versioned"
depends=('ocaml' 'ocaml-migrate-parsetree')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/ppx_tools_versioned/archive/${pkgver}.tar.gz")
sha512sums=('ef9f7ee1402b07a10057f84f1851120256ddd6bee9feb0a3dd3f350d589c97e90aa8b4023288b697d6c0a7424915707d1cedf815e3e3dfbcfa9f42b10f50efde')

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
