# Maintainer: Thomas Letan <lthms@soap.coffee>

_projectname=poll
_authorgh=anuragsoni
pkgname=ocaml-$_projectname
pkgver=0.3.1
pkgrel=1
license=('MIT')
arch=('x86_64')
pkgdesc="Portable OCaml interface to macOS/Linux/Windows native IO event notification mechanisms"
url="https://github.com/$_authorgh/$_projectname"
depends=('ocaml' 'ocaml-kqueue' 'ocaml-ppx_optcomp')
makedepends=('dune')
source=(
  "$pkgname-$pkgver.tbz::https://github.com/$_authorgh/$_projectname/releases/download/$pkgver/$_projectname-$pkgver.tbz"
)
options=('!strip')
sha512sums=(
  "5c47ac2cb4fb52c116a190b323c4e537c8cc1d4d4689653fc1a863cfb19e215468c8c2d93180402fccf83a5e23def540f1f52f2975b7e391155afa593ae5e127"
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
