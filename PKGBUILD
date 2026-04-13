# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Flávio Tapajós <tapajos at outlook doc com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Bailey <nerflad@gmail.com>

pkgname=ocaml-curl
pkgver=0.10.0
pkgrel=2
pkgdesc='OCaml bindings to libcurl'
url='https://ygrek.org/p/ocurl'
arch=('x86_64')
license=('MIT')
depends=('curl>=7.28.0')
makedepends=('ocaml' 'ocaml-findlib' 'dune' 'ocaml-lwt' 'pkg-config')
options=('!strip' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ygrek/ocurl/archive/${pkgver}.tar.gz")
sha256sums=('68b5c12bde559f11e362e3bfe92601c525893f7a2349c7a75198c54d3ea2cce2')

build() {
  cd "${srcdir}/ocurl-${pkgver}"
  export OCAMLPATH="$(ocamlfind printconf destdir)"
  dune build
}

package() {
  cd "${srcdir}/ocurl-${pkgver}"
  dune install --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
