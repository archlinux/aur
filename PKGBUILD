# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-octavius
pkgver=1.2.0
pkgrel=1
pkgdesc="Ocamldoc comment syntax parser"
arch=('x86_64')
url='https://github.com/ocaml-doc/octavius'
license=('ISC')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-doc/octavius/archive/v${pkgver}.tar.gz")
md5sums=('3e6049c39045354853d9dc3a197133ac')

build() {
  cd "${srcdir}/octavius-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/octavius-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
