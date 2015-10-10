# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lastfm
pkgver=0.3.1
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml API to lastfm radio and audioscrobbler")
url="https://github.com/savonet/ocaml-lastfm"
depends=('ocaml' 'ocaml-pcre' 'ocaml-xmlplaylist' 'ocamlnet')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-lastfm/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "ocamlnet402.patch::https://github.com/savonet/ocaml-lastfm/commit/c654b1878d31b4af6ea540b85660544772f9c700.patch")
options=('!strip')
md5sums=('a36c07e5222cfa2181a321fe6d5a31e7'
         'c7f449d6eeabb3942eea375c7cc9c6ba')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 -i "${srcdir}/ocamlnet402.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    make install
}
