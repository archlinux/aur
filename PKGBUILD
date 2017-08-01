# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-migrate-parsetree
pkgver=1.0.2
pkgrel=1
pkgdesc="Convert OCaml parsetrees between different versions"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="https://github.com/let-def/ocaml-migrate-parsetree"
depends=('ocaml' 'ocamlbuild' 'ocaml-result')
makedepends=('ocaml-findlib' 'jbuilder')
options=('!strip')
source=("https://github.com/let-def/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('7bb4f5a054a27fffb4b925dbde38816b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlc -where)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr"

  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/lib/ocaml-migrate-parsetree"{,-ocamlbuild} "${pkgdir}$(ocamlc -where)/"
}
