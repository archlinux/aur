# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-cry
pkgver=0.6.5
pkgrel=2
pkgdesc="OCaml native module for icecast/shoutcast source protocol(s)"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-cry"
license=('GPL')
depends=('ocaml' 'ocaml-ssl')
makedepends=('ocaml-findlib')
options=(!libtool !strip zipman !makeflags staticlibs)
source=("https://github.com/savonet/ocaml-cry/archive/${pkgver}.tar.gz")
sha512sums=('43de3513ee2a0f5e5ad496f48137519de270f836081870b48768e45146a4aab84ad7a0781eac56f7b69ce8724a7fd49e7f9fd9d2d771f133aeef2db96d7254af')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"

    # Install LICENSE
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    awk 'BEGIN{P=0} /License/ {P = 1;} {if (P) print}' README.md > $pkgdir/usr/share/licenses/$pkgname/license
}
