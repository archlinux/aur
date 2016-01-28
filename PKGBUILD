# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-ocamlify
_pkgname=${pkgname/ocaml-/}
pkgver=0.0.1
pkgrel=3
pkgdesc="include files in OCaml code"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/ocamlify"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=(http://forge.ocamlcore.org/frs/download.php/379/$_pkgname-$pkgver.tar.gz)
sha256sums=('75f20c65b834165c98b606b03c7f28c09c03f3ebf12b69dae8ba2d2cf75836c9')
options=(!strip)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  chmod +x configure
  ./configure --prefix /usr --destdir "$pkgdir"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir)
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
  install -Dm 644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
