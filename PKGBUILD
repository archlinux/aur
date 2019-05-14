# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-base
pkgver=0.12.0
pkgrel=1
pkgdesc="Full standard library replacement for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/base'
license=('MIT')
depends=('ocaml' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/base/archive/v${pkgver}.tar.gz")
sha512sums=('5b5c543c1b5380b9725419e33cb0da4f523bac607d7952965a891ec28f2e42ed9817506d04964780bbe3cd5aaae9376005b2b976a371950eca2023011afde9ca')

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
