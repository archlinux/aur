# Maintainer: robertfoster
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Denis Wernert <denis@wernert.info>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ssl
pkgver=0.8.0 # renovate: datasource=github-tags depName=savonet/ocaml-ssl
pkgrel=1
pkgdesc="OCaml SSL Library"
arch=('x86_64')
url="https://github.com/savonet/ocaml-ssl"
license=('custom')
depends=('ocaml' 'openssl')
makedepends=('bubblewrap' 'dune' 'ocaml-findlib')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
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

sha256sums=('b9c45ae1fea3c6d6a247eb6231e6a96b24c0db2d28167aaab93873426b139f3e')
