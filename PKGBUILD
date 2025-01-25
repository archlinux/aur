# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ocaml-uuidm
_pkgname=${pkgname#ocaml-}
pkgver=0.9.9
pkgrel=1
pkgdesc='Universally unique identifiers (UUIDs) for OCaml'
arch=('x86_64')
url=https://erratique.ch/software/uuidm
license=('ISC')
options=('!strip')
depends=('ocaml>=4.08' 'ocaml-cmdliner>=1.1.0')
makedepends=('ocaml-topkg' 'ocaml-findlib' 'ocamlbuild' 'opam')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/dbuenzli/${_pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('0F88B6C240C61EFE6CF6B8CC8258F1A6B6230AB933092547856A24E58CF253EC')

build() {
  cd ${_pkgname}-$pkgver
  ocaml pkg/pkg.ml build --with-cmdliner true
}

package() {
  cd ${_pkgname}-$pkgver

  opam-installer --prefix="${pkgdir}/usr" \
		 --libdir="${pkgdir}$(ocamlc -where)" \
		 --docdir="${pkgdir}/usr/share/doc" \
		 --stubsdir="${pkgdir}$(ocamlc -where)/stublibs" \
		 ./uuidm.install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE.md
}
