# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: John K. Luebs <jkl@johnluebs.com>

pkgname=gapi-ocaml
pkgver=0.2.10
pkgrel=1
pkgdesc="A simple OCaml client for Google Services."
arch=("x86_64" "i686")
url="http://forge.ocamlcore.org/projects/gapi-ocaml/"
license=('MIT')
depends=(
'ocaml>=3.12.0'
'ocaml-findlib>=1.2.7'
'ocamlnet>=3.3.5'
'ocaml-curl>=0.5.3'
'ocaml-cryptokit>=1.3.14'
'ocaml-extlib>=1.5.1'
'ocaml-yojson>=1.0.2'
'ocaml-xmlm>=1.0.2'
)
source=(https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz)
options=('!strip' 'staticlibs')
md5sums=('14ddd4dfbabdc560c9719bcffeafe58b')


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
