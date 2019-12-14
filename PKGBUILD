# Maintainer: robertfoster

pkgname=ocaml-ffmpeg-git
pkgver=r274.2dc8ad0
pkgrel=1
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL2.1')
depends=('ocaml' 'ffmpeg')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags')
source=("$pkgname::git+https://github.com/savonet/ocaml-ffmpeg")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    ./bootstrap
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
    make install
}
md5sums=('SKIP')
