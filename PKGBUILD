# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ocaml-objsize
_pkgname=objsize
pkgver=0.16
pkgrel=2
pkgdesc="A small OCaml library for computing size of OCaml values."
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/objsize/"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'camlp4')
source=(https://forge.ocamlcore.org/frs/download.php/442/$_pkgname-$pkgver.tar.gz int32_int64_t.patch)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < "$srcdir/int32_int64_t.patch"
  make lib
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make tests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p ${pkgdir}$(ocamlfind printconf destdir) 
  make install \
    DESTDIR=$pkgdir \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore
}

# vim:set ts=2 sw=2 et:
sha256sums=('086b8be5964f6a02361735fa3a2ae7d3804699eedfeddab7d12196e1396a2a10'
            'bf56d0f4e4524e40462c239e3ed64a002282d5894acee6e95a6850785ce21fcf')
