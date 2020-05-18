# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Maintainer: Charles E. Hawkins <charlesthehawk@yahoo.com>
# Contributor: Aaron Chen <nextAaron at gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor : Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>

pkgname=ocaml-type-conv
_pkgname=type_conv
pkgver=112.01.02
pkgrel=1
pkgdesc="Generates code from type specifications"
arch=(i686 x86_64)
url="https://janestreet.github.io"
license=(LGPL)
depends=(ocaml)
makedepends=(ocaml-findlib)
source=(https://ocaml.janestreet.com/ocaml-core/112.01.00/individual/$_pkgname-$pkgver.tar.gz)
sha256sums=('342a241a43a2d494739244c8e41624bef25dfae809ebf15577d817ebb67f3890')
options=(!strip !makeflags)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
}
