# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

_pkgname='zed'
pkgname="ocaml-${_pkgname}"
pkgver=1.4
pkgrel=1
pkgdesc="An abstract engine for text editing"
arch=('i686' 'x86_64')
url='https://github.com/diml/zed'
license=('BSD')
depends=('ocaml' 'ocaml-camomile' 'ocaml-react')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/diml/zed/archive/${pkgver}.tar.gz")
md5sums=('47661250ed1b3e12c886d19c1a019675')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure

    env DESTDIR="${pkgdir}" \
        OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
        make
}


package() {
    mkdir -p "${pkgdir}/$(ocamlfind printconf destdir)"
    mkdir -p "${pkgdir}/$(ocamlfind printconf destdir)/stublibs"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    env DESTDIR="${pkgdir}" \
        OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
        make install
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
