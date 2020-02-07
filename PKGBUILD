# Author: Bruno Pagani <archange@archlinux.org>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_pkgname=easy-format
pkgname=ocaml-${_pkgname}
pkgver=1.3.2
pkgrel=3
pkgdesc="Pretty-printing library for OCaml"
arch=('x86_64')
url="https://github.com/ocaml-community/${_pkgname}"
license=('BSD')
options=('!strip' 'staticlibs')
provides=('ocaml-easy-format')
depends=('glibc')
makedepends=('dune')
source=(${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tbz)
sha256sums=('3440c2b882d537ae5e9011eb06abb53f5667e651ea4bb3b460ea8230fa8c1926')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch src/easy_format.ml ../../compile.patch
    dune build -p easy-format
}

package() {
    cd ${_pkgname}-${pkgver}
    DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="lib/ocaml"

    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    rm -rf "${pkgdir}"/usr/doc
}
