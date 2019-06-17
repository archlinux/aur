# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_tools_versioned
pkgver=5.2.2
pkgrel=1
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools (with ocaml-migrate-parsetree support)"
arch=('x86_64')
license=('MIT')
url="https://github.com/ocaml-ppx/ppx_tools_versioned"
depends=('ocaml' 'ocaml-migrate-parsetree')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/ppx_tools_versioned/archive/${pkgver}.tar.gz")
sha512sums=('68c168ebc01af46fe8766ad7e36cc778caabb97d8eb303db284d106450cb79974c2a640ce459e197630b9e84b02caa24b59c97c9a8d39ddadc7efc7284e42a70')

build() {
  cd "${srcdir}/ppx_tools_versioned-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_tools_versioned-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
