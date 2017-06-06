# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_here
pkgver=113.33.03
pkgrel=1
pkgdesc="Expands [%here] into its location"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_here"
license=('Apache')
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_driver')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch"
        "exedir.patch")
md5sums=('4bdb1122a2952a31674d403477ed66c2'
         '7f0a951f1ac87385272ea7a6dd58762a'
         '49475ccc437692638b7079784aa66c1e')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
  patch -Np1 < "${srcdir}/exedir.patch"
}

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  make install PREFIX="${pkgdir}/usr" LIBDIR="${pkgdir}$(ocamlc -where)"
}
