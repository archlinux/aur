# Maintainer: robertfoster

pkgname=ocaml-ffmpeg-git
pkgver=r777.ceb0081
pkgrel=1
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL-2.1-or-later')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
sha256sums=('SKIP')
