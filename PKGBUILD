# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-magic
pkgver=0.7.3
pkgrel=1
pkgdesc="OCaml binding to libmagic"
arch=('i686' 'x86_64')
url="https://github.com/Chris00/ocaml-magic"
license=('LGPL2.1')
depends=('ocaml' 'file')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://downloads.sourceforge.net/project/ocaml-magic/${pkgname}/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/${pkgname}-${pkgver}.tar.gz")
md5sums=('5b8a4d149fe8ce095ab8115f2e49beba')

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
