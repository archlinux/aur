# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-jane-street-headers
pkgver=0.12.0
pkgrel=1
pkgdesc="Jane Street C header files"
arch=('x86_64')
url='https://github.com/janestreet/jane-street-headers'
license=('MIT')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/jane-street-headers-v${pkgver}.tar.gz")
sha512sums=('693fe3ec4fa875d10d6c1fc239355f4e5fc709b87f8e532ea1d8b5aef3ca3318a6ae35c007a30dd7d5ccdc6454d098df886a78a30bfe0ae08d1fd5d97849d62a')

build() {
  cd "${srcdir}/jane-street-headers-v${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/jane-street-headers-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
