# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-typerep
pkgver=113.33.03
pkgrel=1
pkgdesc="A library for runtime types."
arch=('i686' 'x86_64')
url="https://github.com/janestreet/typerep"
license=('Apache')
depends=('ocaml')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz"
        "libdir.patch")
md5sums=('8a1ace5ff29e625d6f1f513a4de24dec'
         '7f0a951f1ac87385272ea7a6dd58762a')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
}

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  make install LIBDIR="${pkgdir}$(ocamlc -where)"
}
