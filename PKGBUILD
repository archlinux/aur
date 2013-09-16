# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
pkgname=ocaml-camomile
pkgver=0.8.4
pkgrel=2
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/yoriyuki/Camomile"
license=('LGPL')
depends=('ocaml' 'ocaml-findlib>=1.2.3')
install=
source=(https://github.com/downloads/yoriyuki/${pkgname/ocaml-}/${pkgname/ocaml-/}-$pkgver.tar.bz2)
md5sums=('389f1a7e5c2a634fbb3ea6f764d77bd3')
options=(!strip !makeflags)

build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

  ./configure --prefix=/usr
  mkdir -p $pkgdir$(ocamlfind printconf destdir) || return 1
  mkdir -p $pkgdir/usr/bin
  sed -i -e 's|ocamlfind install|ocamlfind install -destdir '$pkgdir$(ocamlfind printconf destdir)'|' Makefile || return 1
  make || return 1
  make DATADIR="$pkgdir/usr/share" BINDIR="$pkgdir/usr/bin" install
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

