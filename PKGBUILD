# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com> 
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-stdio
pkgver=0.13.0
pkgrel=1
pkgdesc="Standard IO library for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/stdio'
license=('MIT')
depends=('ocaml' 'ocaml-base')
makedepends=('dune')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d778d37b5dfca42f585afaea344649145b0d0b15202646eeba01b43ad14319361f577542382e1209e3720072a19494b2f23b74e91796df3eb0c2d8613b0e0f12')

build() {
  cd "${srcdir}/stdio-${pkgver}"
  dune build
}

package() {
  cd "${srcdir}/stdio-${pkgver}"
  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
