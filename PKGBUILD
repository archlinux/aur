# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=ocaml-ezjsonm
pkgver=1.3.0
pkgrel=2
license=('custom:ISC')
arch=('x86_64')
pkgdesc="An easy interface on top of the Jsonm library."
url="https://github.com/mirage/ezjsonm"
depends=(
  'ocaml'
  'ocaml-hex'
  'ocaml-uutf'
  'ocaml-sexplib0'
  'ocaml-jsonm'
)
makedepends=('dune')
source=(
  "$pkgname-$pkgver.tbz::https://github.com/mirage/ezjsonm/releases/download/v$pkgver/ezjsonm-$pkgver.tbz"
)
options=('!strip')
sha512sums=(
  "b731036384115603af9187464695418d27b7cf6f763c8dbc0812db62a7657cac1b6019d3b205b1c95ae81b7dab0bd4037390d977ee8c122bef29a9ddef771e18"
)

build() {
  cd "${srcdir}/ezjsonm-${pkgver}"
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.
  dune build -p ezjsonm
}

package() {
  cd "${srcdir}/ezjsonm-${pkgver}"
  DESTDIR="${pkgdir}" dune install ezjsonm --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
