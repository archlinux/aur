# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-migrate-parsetree
pkgver=1.1.0
pkgrel=1
pkgdesc="Convert OCaml parsetrees between different versions"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="https://github.com/ocaml-ppx/ocaml-migrate-parsetree"
depends=('ocaml' 'ocaml-result')
optdepends=('ocamlbuild: For ocamlbuild plugin')
makedepends=('ocaml-findlib' 'dune' 'ocamlbuild')
options=('!strip')
source=("https://github.com/ocaml-ppx/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tbz")
sha512sums=('23c61d1eae05d5090712038d58c807f2959172d37b0eaf0e43ed6f3fe9a7b52390ebace173350abb47bc3be17be5659f9a6d8751ae6e0794f540780a58711d01')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"

  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
