pkgname=ocaml-uutf
pkgver=1.0.3
pkgrel=1
pkgdesc="Non-blocking streaming Unicode codec for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/dbuenzli/uutf"
license=('GPL')
depends=('ocaml' 'ocaml-cmdliner' 'ocaml-uchar' 'ocaml-findlib' 'ocaml-topkg' 'ocamlbuild')
makedepends=('opam')
source=(https://github.com/dbuenzli/uutf/archive/v$pkgver.tar.gz)
sha256sums=('bfa4cbfef0e585e4113f32c0ccc70df9d8da3ae45ca91ea4a50e2b9ca0b44094')
options=(!libtool !strip zipman)

build() {
  cd "$srcdir/uutf-$pkgver"
  ocaml pkg/pkg.ml build
}

package() {
  cd "$srcdir/uutf-$pkgver"

  opam-installer -i \
    --prefix="$pkgdir/usr" \
    --libdir="$pkgdir/usr/lib/ocaml" \
    --docdir="$srcdir/uutf-$pkgver/.omit" \
    uutf.install

  # Remove annotation files.
  rm -Rf "$pkgdir"/usr/lib/ocaml/$_pkgname/*.cmt*
}

# vim:set ts=2 sw=2 et:
