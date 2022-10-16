# Christopher Price <pricechrispy at gmail dot com>
# Contributor: nerflad (nerflad@gmail.com)

pkgname=gapi-ocaml
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple OCaml client for Google Services."
arch=("x86_64" "i686" "armv7h")
url="https://astrada.github.io/gapi-ocaml/"
license=('MIT')
makedepends=(
'dune'
'ocaml-ounit'
)
depends=(
'ocaml>=4.02.3'
'ocaml-findlib>=1.2.7'
'ocamlnet>=4.1.4'
'ocaml-curl>=0.5.3'
'ocaml-cryptokit>=1.3.14'
'ocaml-yojson>=1.6.0'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
options=('!strip' 'staticlibs')
sha256sums=('9c4c6dfa43443675d2ac0a14ec6ff5a105e274dc8bb4cdef657fb5f6e0af5b2a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  dune build @install
  sed -i '/doc:\s\[/,$d' _build/default/gapi-ocaml.install
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  install -dm755 "$OCAMLFIND_DESTDIR"

  dune install
}
