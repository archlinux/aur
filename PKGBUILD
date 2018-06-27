# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ppx_derivers
pkgname=ocaml-${_pkgname}
pkgver=1.2
pkgrel=1
pkgdesc="Deriving plugin registry"
arch=('x86_64')
url="https://github.com/ocaml-ppx/ppx_derivers"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml-findlib' 'dune')
source=("https://github.com/ocaml-ppx/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tbz")
md5sums=('5aad8dd5f95a81baf603a9d2f5d3d904')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
