# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-cairo-git
pkgver=20201125
pkgrel=1
pkgdesc="OCaml binding to Cairo, a 2D Vector Graphics Library"
arch=('x86_64')
url="https://github.com/Chris00/ocaml-cairo"
license=('LGPL3')
depends=('ocaml>=4.11.1' 'cairo' 'lablgtk2')
makedepends=('ocaml-findlib' 'dune')
provides=('ocaml-cairo')
source=("git://github.com/Chris00/ocaml-cairo.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/ocaml-cairo"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "${srcdir}/ocaml-cairo"
  dune build -p cairo2,cairo2-gtk,cairo2-pango
}

package() {
  cd "${srcdir}/ocaml-cairo"
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
