# Maintainer: robertfoster
pkgname=ocaml-lame-git
pkgver=r118.8134d50
pkgrel=1
pkgdesc="OCaml bindings to the LAME mp3 encoder"
arch=('x86_64')
url="https://github.com/savonet/ocaml-lame"
license=('GPL-2.0-or-later')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('ocaml' 'lame')
makedepends=('dune')
options=('!strip' '!makeflags')
source=("$pkgname::git+https://github.com/savonet/ocaml-lame")

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
  dune install --prefix "${pkgdir}/usr" --libdir \
    "${pkgdir}$(ocamlfind printconf destdir)"

  # Remove docs
  rm -rf "${pkgdir}/usr/doc"
}
sha256sums=('SKIP')
