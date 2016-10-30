# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

_pkgname="lambda-term"
pkgname="ocaml-${_pkgname}"
pkgver=1.10.1
pkgrel=1
pkgdesc='A cross-platform library for manipulating the terminal'
arch=('i686' 'x86_64')
url='https://github.com/diml/lambda-term'
license=('BSD')
depends=('ocaml' 'ocaml-lwt' 'ocaml-react' 'ocaml-zed')
makedepends=('ocaml-findlib')
source=("https://github.com/diml/lambda-term/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('1ad66f7e3f517f1f40528400d8cd00d9')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix /usr --destdir "${pkgdir}"

    env DESTDIR="${pkgdir}" \
        OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
        make
}


package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
    install -dm755 "${OCAMLFIND_DESTDIR}/stublibs"
    make install
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
