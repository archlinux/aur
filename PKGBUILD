# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: oliver < a t >  first . in-berlin . de

pkgname=camlpdf-git
pkgver=2.8.r16.g9c40794
pkgrel=1
pkgdesc="PDF-processing-library for OCaml"
arch=('x86_64')
license=('LGPL-2.1-or-later')
url="https://github.com/johnwhitington/camlpdf"
source=("git+$url.git")
depends=('glibc')
makedepends=('ocaml-findlib' 'git' 'gcc')
options=(!makeflags staticlibs)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/-/.r/' | tr - .| cut -c2-
}

build() {
  cd ${pkgname%-git}
  OCAMLFIND_DESTDIR="$pkgdir"/$(ocamlfind printconf destdir)
  make OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR"
}

package() {
  cd ${pkgname%-git}
  OCAMLFIND_DESTDIR="$pkgdir"/$(ocamlfind printconf destdir)
  install -d $OCAMLFIND_DESTDIR
  OCAMLFIND_LDCONF="$pkgdir"/$(ocamlfind printconf ldconf)
  make install -d OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" OCAMLFIND_LDCONF="$OCAMLFIND_LDCONF"
}
