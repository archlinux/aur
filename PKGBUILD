# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ocaml-ctypes-git
pkgver=0.3.3
pkgrel=1
pkgdesc='Library for binding to C libraries using pure OCaml'
arch=('i686' 'x86_64')
url=https://github.com/ocamllabs/ocaml-ctypes
license=('custom')
depends=('ocaml' 'libffi')
makedepends=('ocaml-findlib>=1.5.3' 'git')
options=('!strip')
source=("$pkgname::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname

  make -j 1
#    ocaml setup.ml -configure --destdir $pkgdir/usr/lib/ocaml
#   ocaml setup.ml -build
}

package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"

  cd $pkgname
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF=ignore
  make install
}
 
