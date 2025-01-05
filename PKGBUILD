# Maintainer: Thomas Letan <lthms@soap.coffee>

_projectname=kqueue
pkgname=ocaml-$_projectname
pkgver=0.4.0
pkgrel=2
license=('BSD-3-Clause')
arch=('x86_64')
pkgdesc="OCaml bindings to kqueue"
url="https://github.com/anuragsoni/$_projectname-ml"
depends=('ocaml' 'ocaml-ppx_optcomp')
makedepends=('dune')
source=(
  "$pkgname-$pkgver.tbz::https://github.com/anuragsoni/$_projectname-ml/releases/download/$pkgver/$_projectname-$pkgver.tbz"
)
options=('!strip')
sha512sums=('e3ddea1744713aebb980745381b0cbc86365ba0ae022ba38714199928cb6df06ee2cdb1bb928bf0100b6aaf8839b0ffce71f284962e4275cabc5cd645b5324bc')

build() {
  cd "${srcdir}/$_projectname-${pkgver}"
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.
  dune build -p $_projectname
}

package() {
  cd "${srcdir}/$_projectname-${pkgver}"
  DESTDIR="${pkgdir}" dune install $_projectname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
