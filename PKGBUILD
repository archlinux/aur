# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-type_conv
pkgver=113.00.02
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Support library for preprocessor type conversions"
url="https://github.com/janestreet/type_conv"
depends=('ocaml' 'camlp4')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('62b64cf98ad2685a718dd7d1706497f5')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR"
  DESTDIR="${pkgdir}" \
    OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
    make install
}
