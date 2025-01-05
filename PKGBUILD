# Maintainer: Thomas Letan <lthms@soap.coffee>

_projectname=ezjsonm-encoding
pkgname=ocaml-$_projectname
pkgver=2.1.0
pkgrel=1
license=('MPL2')
arch=('x86_64')
pkgdesc="Encoding combinators a la Data_encoding for Ezjsonm"
url="https://github.com/lthms/$_projectname"
depends=('ocaml' 'ocaml-ezjsonm')
makedepends=('dune')
source=(
  "$pkgname-$pkgver.tbz::https://github.com/lthms/$_projectname/releases/download/$pkgver/$_projectname-$pkgver.tbz"
)
options=('!strip')
sha512sums=('68252b15b8b00a1a97edf0d51b97fd5b3e61a640ce68602ba93473c46576af037453148c16ec3fa3b0af83f2358a863928ce0ec761a9193669632cb76a4d1a0d')

build() {
  cd "${srcdir}/$_projectname-${pkgver}"
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.
  dune build -p $_projectname
}

package() {
  cd "${srcdir}/$_projectname-${pkgver}"
  DESTDIR="${pkgdir}" dune install $_projectname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
