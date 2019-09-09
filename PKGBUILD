# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-parsexp
pkgver=0.12.0
pkgrel=1
pkgdesc="S-expression parsing library"
arch=('x86_64')
url="https://github.com/janestreet/parsexp"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/parsexp-v${pkgver}.tar.gz")
sha512sums=('849968ac69709b293208fabde5cc22972a3def3ed35517e571c5127b417c7129a0d9eafc94fd580508203b611a9614b2612670dbdf69887b0e71f7cc5278bf12')

build() {
  cd "${srcdir}/parsexp-v${pkgver}"

  dune build --profile release
}


package() {
  cd "${srcdir}/parsexp-v${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
