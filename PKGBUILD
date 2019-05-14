# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-sexplib0
pkgver=0.12.0
pkgrel=1
pkgdesc="Library containing the definition of S-expressions and some base converters"
arch=('x86_64')
url='https://github.com/janestreet/sexplib0'
license=('MIT')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/sexplib0-v${pkgver}.tar.gz")
sha512sums=('104f8526a147cfa6ecf168c8ee10a78ad3133c0a8a3714dc9dffd6358152752b337262b857c89170e07071ae669724da6f5556304c5abb3e9ce505ec700b7ad8')

build() {
  cd "${srcdir}/sexplib0-v${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/sexplib0-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
