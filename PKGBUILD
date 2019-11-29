# NOTE: This is just a dummy module to satisfy dependencies, uchar is provided
# directly by ocaml since 4.03.
pkgname=ocaml-uchar
_pkgname=uchar
pkgver=0.0.2
pkgrel=0
pkgdesc="Compatibility library for OCaml's Uchar module"
url="https://github.com/ocaml/uchar"
arch=('i686' 'x86_64')
license=('LGPL-2.1-WITH-linking-exception')
depends=('ocaml')
makedepends=('ocaml' 'ocamlbuild' 'opam')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocaml/uchar/archive/v$pkgver.tar.gz")
sha512sums=("487a9706cf9dfc9b9c94442a51766cc211687d6ebcb4dd3c94d09cb1ed6d7fd61e966e91a4121fe2d1681b2fd6bfee9079d3bccccdb6d65ba2111524ab5dd1bc")

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ocaml pkg/build.ml \
    native=true \
    native-dynlink=true
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  opam-installer -i \
    --prefix="$pkgdir/usr" \
    --libdir="$pkgdir/usr/lib/ocaml" \
    $_pkgname.install
}
