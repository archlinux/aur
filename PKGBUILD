# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lo
pkgver=0.1.2
pkgrel=1
pkgdesc="OCaml bindings for LO library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lo"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'liblo')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-lo/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('58ef8ae316ea41e5cf7d1a80c2f86f85e8b01903823df7c1fde80ea28ab9b5105535cb56fad0fd6649a23502426c713964fec4977d821ec5d3c4483036e2ccf0')

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
