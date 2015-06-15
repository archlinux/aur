# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: John K. Luebs <jkl@johnluebs.com>

pkgname=gapi-ocaml
pkgver=0.2.6
pkgrel=1
pkgdesc="A simple OCaml client for Google Services."
arch=("x86_64" "i686")
url="http://forge.ocamlcore.org/projects/gapi-ocaml/"
license=('MIT')
depends=('ocaml' 'ocaml-cryptokit' 'ocaml-curl' 'ocaml-extlib' 'ocaml-yojson' 'ocaml-xmlm' 'ocamlnet')
source=(https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz)
options=('!strip' 'staticlibs')
md5sums=('e158c98587681652decdff6302e423b7')


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
