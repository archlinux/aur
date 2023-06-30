# Maintainer: robertfoster
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Denis Wernert <denis@wernert.info>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ssl
pkgver=0.6.0
pkgrel=1
pkgdesc="OCaml SSL Library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ssl"
license=('custom')
depends=('ocaml' 'openssl')
makedepends=('bubblewrap' 'dune' 'ocaml-findlib')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
options=(!libtool !strip zipman !makeflags staticlibs)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('ae0523dfabf919b060925980aad2bf33043f5000aa4fc4dd2dca4f21721395a9')
