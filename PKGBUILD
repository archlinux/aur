# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Aaron Chen <nextAaron at gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>

pkgname=ocaml-sexplib
pkgver=113.00.00
pkgrel=1
pkgdesc="Library for serializing OCaml values to and from S-expressions"
arch=('i686' 'x86_64')
license=('Apache')
depends=('ocaml>=4.02.1')
makedepends=('ocaml-findlib')
options=('!strip')
url="https://github.com/janestreet/sexplib"
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
md5sums=('642c795001cc3df4631e678852c806c8')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix /usr --destdir $pkgdir
  make
}

package(){
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
}
