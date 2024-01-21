# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=ocaml-hex
pkgver=1.5.0
pkgrel=1
license=('custom:ISC')
arch=('x86_64')
pkgdesc="Hexadecimal converter"
url="https://github.com/mirage/ocaml-hex"
depends=('ocaml' 'ocaml-cstruct')
makedepends=('dune')
source=(
  "$pkgname-$pkgver.tbz::https://github.com/mirage/ocaml-hex/releases/download/v$pkgver/hex-$pkgver.tbz"
)
options=('!strip')
sha512sums=(
  "baa09b47a90f0a54ad2becfb272f0674219e4fc0c03559deff26aaf13ccd59258b31bf98e56c44a5a8fa03437e3eba2bf5f0cd76e52d184d26cfb1170c490462"
)

build() {
  cd "${srcdir}/hex-${pkgver}"
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.
  dune build -p hex
}

package() {
  cd "${srcdir}/hex-${pkgver}"
  DESTDIR="${pkgdir}" dune install hex --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
