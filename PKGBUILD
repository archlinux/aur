# Maintainer: robertfoster
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Denis Wernert <denis@wernert.info>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ssl
pkgver=0.5.10
pkgrel=1
pkgdesc="OCaml SSL Library"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('custom')
depends=('ocaml' 'openssl')
makedepends=('bubblewrap' 'dune')
source=("https://github.com/savonet/ocaml-ssl/archive/v${pkgver}.tar.gz")
options=(!libtool !strip zipman !makeflags staticlibs)

build() {
  cd "${pkgname}-${pkgver}"
  dune build
}

package() {
  cd "${pkgname}-${pkgver}"
  dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"

  # Install LICENSE
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  awk 'BEGIN{P=0} /License/ {P = 1;} {if (P) print}' README.md >"${pkgdir}/usr/share/licenses/${pkgname}/license"
}

md5sums=('afebbdc3130c1addf1da31e3b92c1dcd')
