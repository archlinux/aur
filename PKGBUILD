# Maintainer: nerflad (nerflad@gmail.com)

pkgname=gapi-ocaml
pkgver=0.3.5
pkgrel=1
pkgdesc="A simple OCaml client for Google Services."
arch=("x86_64" "i686" "armv7h")
url="https://astrada.github.io/gapi-ocaml/"
license=('MIT')
makedepends=('ocamlbuild')
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
sha256sums=('c913341cd29a0a6bb8fcfad4783eeea2d8d1c6d4a287f1bcf538d0d5f8d22f20')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ocaml setup.ml -configure --prefix /usr --destdir $pkgdir --disable-tests
  ocaml setup.ml -build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  install -dm755 "$OCAMLFIND_DESTDIR"

  ocaml setup.ml -install
}
