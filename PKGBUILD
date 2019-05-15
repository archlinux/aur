# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-octavius
pkgver=1.2.1
pkgrel=1
pkgdesc="Ocamldoc comment syntax parser"
arch=('x86_64')
url='https://github.com/ocaml-doc/octavius'
license=('ISC')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-doc/octavius/archive/v${pkgver}.tar.gz")
sha512sums=('4d0c0206312cc5272d459f8b73467074724450a67eb2e8a00129fadeccc5ddec69efcb3cb60f7d510f614c01142bd6b4dbec845f1da452f810f5ab28db93fa94')

build() {
  cd "${srcdir}/octavius-${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/octavius-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
