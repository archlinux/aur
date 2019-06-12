# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-base
pkgver=0.12.2
pkgrel=1
pkgdesc="Full standard library replacement for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/base'
license=('MIT')
depends=('ocaml' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/base/archive/v${pkgver}.tar.gz")
sha512sums=('d36a1cf6ffe91b7c51a53deedec529f27c235a01d99934e22cafa7554f91e1fe8e4599ca2c4483fe8910a80b8ee013877bd1e87ee65e0361648f22fb3a8b46c7')

build() {
  cd "${srcdir}/base-${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/base-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
