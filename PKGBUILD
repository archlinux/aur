# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-migrate-parsetree
pkgver=1.0.10
pkgrel=1
pkgdesc="Convert OCaml parsetrees between different versions"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="https://github.com/ocaml-ppx/ocaml-migrate-parsetree"
depends=('ocaml' 'ocaml-result')
optdepends=('ocamlbuild: For ocamlbuild plugin')
makedepends=('ocaml-findlib' 'dune' 'ocamlbuild')
options=('!strip')
source=("https://github.com/ocaml-ppx/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('7eb12fa82ea70bd89478e18464f39949')

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
