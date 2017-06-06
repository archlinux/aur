# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-bin_prot
pkgver=113.33.03
pkgrel=1
pkgdesc="A binary protocol generator"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/bin_prot"
license=('Apache')
depends=('ocaml')
makedepends=('ocaml-js-build-tools' 'ocaml-findlib' 'opam')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
md5sums=('d90c8977da36e4aafd3e0421744fd818'
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

  make install PREFIX="${pkgdir}/usr" LIBDIR="${pkgdir}$(ocamlc -where)"
}
