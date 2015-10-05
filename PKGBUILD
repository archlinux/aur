# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-pipebang
pkgver=113.00.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="OCaml syntax extension to transform x |! f into f x"
url="https://github.com/janestreet/pipebang"
depends=('ocaml' 'camlp4')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('685ee2184eb95270751c58790f93dd0b')

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
