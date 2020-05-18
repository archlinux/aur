# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-taglib
pkgver=0.3.6
pkgrel=2
pkgdesc="OCaml bindings to taglib"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-taglib"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'taglib')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-taglib/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b5744b57beb63761cd5ad1a6d9824e1d3e5da2e94649544217264441a9e561f722b31359df02457465eacf168ff162e5bf524df1c239a98d1277466aa887518a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
    make install
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
