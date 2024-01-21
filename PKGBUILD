# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=ocaml-cstruct
pkgver=6.2.0
pkgrel=1
license=('custom:ISC')
arch=('x86_64')
pkgdesc="Map OCaml arrays onto C-like structs"
url="https://github.com/mirage/ocaml-cstruct"
depends=('ocaml')
makedepends=('dune')
source=(
  "$pkgname-$pkgver.tbz::https://github.com/mirage/ocaml-cstruct/releases/download/v$pkgver/cstruct-$pkgver.tbz"
)
options=('!strip')
sha512sums=(
  "8d33fe6b3707a3994d0225cd33cadde0bb2ca834ef01096e3df33a08e4a8c6d02ebccddf558a73988b8a5595b65fdc10de61efbf872c6c9e55c719c7e19c463d"
)

build() {
  cd "${srcdir}/cstruct-${pkgver}"
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.
  dune build -p cstruct
}

package() {
  cd "${srcdir}/cstruct-${pkgver}"
  DESTDIR="${pkgdir}" dune install cstruct --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
