# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Thomas Pani <thomas.pani@gmail.com>

pkgname=ocaml-fileutils
pkgver=0.4.5
oldver=0.4.4
pkgrel=1
pkgdesc="A library to provide pure OCaml functions to manipulate real file and filename."
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/ocaml-fileutils"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'ocaml-ounit')
source=(http://forge.ocamlcore.org/frs/download.php/892/ocaml-fileutils-$pkgver.tar.gz)
md5sums=('1f43b9333358f47660318bfbe9ae68bf')

build() {
  cd "$srcdir/$pkgname-$oldver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$pkgname-$oldver"

  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
  install -Dm 644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
