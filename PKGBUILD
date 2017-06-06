# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-js-build-tools
pkgver=113.33.06
pkgrel=1
pkgdesc="Collection of tools to help building Jane Street Packages"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/js-build-tools"
license=('Apache')
depends=('ocaml')
makedepends=('ocaml-findlib' 'opam')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
md5sums=('779788c38260f90132f36a580ba0c60e'
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
