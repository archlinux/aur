# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: oliver < a t >  first . in-berlin . de

_pkgname=camlpdf
pkgname=$_pkgname-git
pkgver=2.2.1.r47.g1e8e698
pkgrel=1
pkgdesc="PDF-processing-library for OCaml"
arch=('x86_64')
license=('LGPL')
url="https://github.com/johnwhitington/camlpdf"
source=("git+$url.git")
depends=('glibc')
makedepends=('ocaml-findlib' 'git' 'gcc')
options=(!makeflags staticlibs)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

build() {
  cd $srcdir/$_pkgname
  OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  make OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR"
}

package() {
  cd ${srcdir}/$_pkgname
  OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  mkdir -p $OCAMLFIND_DESTDIR
  OCAMLFIND_LDCONF="$pkgdir/$(ocamlfind printconf ldconf)"
  make install -d OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" OCAMLFIND_LDCONF="$OCAMLFIND_LDCONF"
}
