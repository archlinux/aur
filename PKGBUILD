# Maintainer: robertfoster
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Denis Wernert <denis@wernert.info>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ssl
pkgver=0.5.10
pkgrel=2
pkgdesc="OCaml SSL Library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ssl"
license=('custom')
depends=('ocaml' 'openssl')
makedepends=('bubblewrap' 'dune' 'ocaml-findlib')
source=("${url}/archive/v${pkgver}.tar.gz")
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

sha256sums=('943331e9f87edc6c572c6f18e875824d056918a533323f7c2a1a5214cd458c6d')
