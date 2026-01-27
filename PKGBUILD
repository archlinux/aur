# Author: Bruno Pagani <archange@archlinux.org>
# Maintainer: Zhiwei Chen <condy0919@gmail.com)

_pkgname=yojson
pkgname=ocaml-${_pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc="Low level JSON binary for OCaml"
arch=('x86_64')
url="https://github.com/ocaml-community/${_pkgname}"
license=('BSD')
options=('!strip' 'staticlibs')
depends=('ocaml' 'ocaml-biniou' 'ocaml-easy-format')
makedepends=('dune')
source=(https://github.com/ocaml-community/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tbz)
sha256sums=('ab5d863f7f951a8f7fb4a708399ca2da2cf139a5e0af7818145c20295420cb1a')

build() {
  cd ${_pkgname}-${pkgver}

  # no benchmarks
  rm -rf bench/

  dune build -p yojson
}

package() {
  cd ${_pkgname}-${pkgver}

  DESTDIR="${pkgdir}" dune install -p yojson --prefix=/usr --libdir="/usr/lib/ocaml"

  # remove rogue dune-package file
  rm -r "${pkgdir}"/usr/doc
  rm -r "${pkgdir}"/usr/lib/ocaml/${_pkgname}/dune-package
}
