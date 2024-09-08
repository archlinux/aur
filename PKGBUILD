# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=ocaml4-camlp4
pkgver=4.14+1
pkgrel=3
pkgdesc='Caml preprocessor and pretty-printer'
arch=(x86_64)
url='https://github.com/ocaml/camlp4/releases'
license=(GPL2)
depends=(ocaml4)
makedepends=(ocaml4-ocamlbuild ocaml4-compiler-libs ocaml4-findlib ocaml4-camlp-streams)
conflicts=(ocaml-camlp4)
options=(!makeflags !emptydirs staticlibs)
source=("camlp4-${pkgver}.tar.gz::https://github.com/camlp4/camlp4/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('93d52b5be818c3662f6aa462a33c908a68bc85a19554f2352e2a146edbe0b39f7c9de2807a507c4f83fc59188030d085eca473afd03e71e05b039950683542ef')

build() {
  cd "camlp4-${pkgver//+/-}"
  CFLAGS+=' -ffat-lto-objects -w'
  ./configure
  make all camlp4/META
}

package() {
  cd "camlp4-${pkgver//+/-}"
  make \
    BINDIR="$pkgdir/usr/bin" \
    LIBDIR="$pkgdir/usr/lib/ocaml" \
    PKGDIR="$pkgdir/usr/lib/ocaml" \
    install install-META
}
