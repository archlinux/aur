# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-mad
pkgver=0.4.6
pkgrel=1
pkgdesc="OCaml bindings to the MAD mp3 decoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-mad"
license=('GPL2')
depends=('ocaml' 'libmad')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-mad/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8bd4cca2307744fa75fcc0c3511950b10d79bfcb1e02d6ecac8688cd87990e46d979fb72eea51032ce6e85e5a8c285dadf9b3f6729e7d7ca1a459a933893e0a0')

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
}
