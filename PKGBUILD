# Maintainer: robertfoster
pkgname=ocaml-fdkaac-git
pkgver=r104.6d6566b
pkgrel=1
pkgdesc="OCaml binding for the fdk-aac library"
arch=('x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL-2.0-or-later')
depends=('ocaml' 'libfdk-aac')
makedepends=('dune' 'git')
options=('!strip' '!makeflags')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/savonet/ocaml-fdkaac.git")

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

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
