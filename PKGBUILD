# Maintainer: nerflad (nerflad@gmail.com)

pkgname=gapi-ocaml
pkgver=0.3.9
pkgrel=1
pkgdesc="A simple OCaml client for Google Services."
arch=("x86_64" "i686" "armv7h")
url="https://astrada.github.io/gapi-ocaml/"
license=('MIT')
makedepends=('dune')
depends=(
'ocaml>=4.02.3'
'ocaml-findlib>=1.2.7'
'ocamlnet>=4.1.4'
'ocaml-curl>=0.5.3'
'ocaml-cryptokit>=1.3.14'
'ocaml-extlib>=1.5.1'
'ocaml-yojson>=1.0.2'
'ocaml-xmlm>=1.0.2'
)
source=(https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz)
options=('!strip' 'staticlibs')
sha256sums=('77f15524a8ad35dbde0480bf82bcd26f764a50ae65d8027de93821f256969982')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  jbuilder build @install
  sed -i '/doc:\s\[/,$d' _build/default/gapi-ocaml.install
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  install -dm755 "$OCAMLFIND_DESTDIR"

  jbuilder install
}
