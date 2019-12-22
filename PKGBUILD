pkgname=ocaml-uutf
pkgver=1.0.2
pkgrel=2
pkgdesc="Non-blocking streaming Unicode codec for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/dbuenzli/uutf"
license=('GPL')
depends=('ocaml' 'ocaml-cmdliner' 'ocaml-uchar')
source=(https://github.com/dbuenzli/uutf/archive/v$pkgver.tar.gz)
md5sums=('811ea24e7a86cd27cfc8239b24d1b92c')
sha256sums=('16981ddb98589ac6a3407c9ac1d0b98eb99bee39c6954d021ab39df33ff23dd5')
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
