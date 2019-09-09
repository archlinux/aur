# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Aaron Chen <nextAaron at gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>

pkgname=ocaml-sexplib
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Library for serializing OCaml values to and from S-expressions"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/sexplib"
license=('MIT' 'BSD')
depends=('ocaml' 'ocaml-parsexp' 'ocaml-sexplib0' 'ocaml-num')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/sexplib-v${pkgver}.tar.gz")
sha512sums=('bd050e59f5269f15b3362891f98417c78bbe6e18c630488ac3df769dd70180beb4e1bbf55e32327fd2dec9a6041969bcaa4f9d16b9295e33cc82af1515404701')

build() {
  cd "${srcdir}/sexplib-v${pkgver}"

  dune build --profile release
}

package(){
  cd "${srcdir}/sexplib-v${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "LICENSE-Tywith.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Tywith.txt"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
