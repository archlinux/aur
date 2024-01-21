# Maintainer: Thomas Letan <lthms@soap.coffee>

_projectname=ezjsonm-encoding
pkgname=ocaml-$_projectname
pkgver=2.0.0
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
sha512sums=(
  "6ed40eabfc335e4619873dae832c5ce0e35acd425014adc13f47e39d980c5972a2490c3781d4edfb4e4ed829f64a7831890a296ae13c8d0c208f5972e44a48d5"
)

build() {
  cd "${srcdir}/$_projectname-${pkgver}"
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.
  dune build -p $_projectname
}

package() {
  cd "${srcdir}/$_projectname-${pkgver}"
  DESTDIR="${pkgdir}" dune install $_projectname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
