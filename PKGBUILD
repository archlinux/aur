# Maintainer: robertfoster

pkgname=ocaml-ffmpeg-git
pkgver=0.4.1.r120.3b1b6c7
pkgrel=1
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL2.1')
depends=('ocaml' 'ffmpeg')
makedepends=('dune' 'git')
options=('!strip' '!makeflags')
source=("$pkgname::git+${url}")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
