# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ffmpeg
pkgver=0.4.2
pkgrel=1
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL2.1')
depends=('ocaml' 'ffmpeg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-ffmpeg/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7c845462e52520ccc617033c758e4a75461bf56e9cafdf6ec5811c4385502ce3d868a5fdb52e82e1cfc5f483bdf2246c3ddd5ec7967de681961411604cb63e7e')

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
