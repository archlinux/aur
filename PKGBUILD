# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-base
pkgver=0.13.0
pkgrel=1
pkgdesc="Full standard library replacement for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/base'
license=('MIT')
depends=('ocaml' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/base/archive/v${pkgver}.tar.gz")
sha512sums=('f753057ed5bda069c5ab535ad98e7277c8326923000dc9f164602973861fb00340d1976d48777f193bc8c0d5bd56a6c47d5b760d4833244047bff1304083e4e8')

build() {
  cd "${srcdir}/base-${pkgver}"

  dune build --profile release
}


package() {
  cd "${srcdir}/base-${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
