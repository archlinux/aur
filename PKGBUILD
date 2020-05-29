# Maintainer: robertfoster

pkgname=ocaml-ffmpeg-git
pkgver=r323.1273a5e
pkgrel=2
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL2.1')
depends=('ocaml' 'ffmpeg')
makedepends=('dune' 'git')
options=('!strip' '!makeflags')
source=("$pkgname::git+https://github.com/savonet/ocaml-ffmpeg")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    dune build
}

package() {
    cd "${srcdir}/${pkgname}"
    dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}

md5sums=('SKIP')
