# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-re
pkgver=1.4.1
pkgrel=1
pkgdesc="Pure OCaml regular expressions, with support for Perl and POSIX-style strings"
arch=('i686' 'x86_64')
depends=('ocaml')
makedepends=('ocaml-findlib')
url="https://github.com/ocaml/ocaml-re"
license=('LGPL')
options=('!strip')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ocaml/ocaml-re/tar.gz/$pkgname-$pkgver)
sha256sums=('262554309d645f4126a2a2e21e3a798d250293264fda34d6271243cc6c16e576')

build() {
  cd "$pkgname-$pkgname-$pkgver"

  msg2 'Building...'
  ocaml setup.ml -configure --destdir "$pkgdir/usr/lib/ocaml"
  ocaml setup.ml -build
}


package() {
  cd "$pkgname-$pkgname-$pkgver"

  msg2 'Installing...'
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
  OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
    ocaml setup.ml -install
}
