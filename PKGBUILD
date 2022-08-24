# Maintainer: robertfoster
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Denis Wernert <denis@wernert.info>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ssl
pkgver=0.5.12
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

sha256sums=('3ef53f92035cdf65adb520b004cef881dccf0545637e1b0a5b4c1b0f13e1df55')
