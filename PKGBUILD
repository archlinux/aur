# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Aaron Chen <nextAaron at gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>

pkgname=ocaml-sexplib
pkgver=113.33.03
pkgrel=1
pkgdesc="Library for serializing OCaml values to and from S-expressions"
arch=('i686' 'x86_64')
license=('Apache')
depends=('ocaml')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip')
url="https://github.com/janestreet/sexplib"
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz"
        "libdir.patch")
md5sums=('739af487f05e0ffd8626e9acb653b33d'
         '7f0a951f1ac87385272ea7a6dd58762a')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
}

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix /usr
  make
}

package(){
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  make install LIBDIR="${pkgdir}$(ocamlc -where)"
}
