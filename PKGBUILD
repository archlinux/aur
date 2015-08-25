# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=ocaml-curl
pkgver=0.5.3
pkgrel=5
pkgdesc="OCaml bindings to libcurl networking library"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ocaml' 'curl>=7.9.8')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
url='http://sourceforge.net/projects/ocurl/'
source=("http://sourceforge.net/projects/ocurl/files/ocurl/$pkgver/ocurl-$pkgver.tgz")
md5sums=('c8b955e51f79dd2c62ab89577b27fe37')

build() {
  cd "$srcdir/ocurl"
  ./configure --prefix /usr
  make
}

package() {
  cd "$srcdir/ocurl"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install FINDLIB=ocamlfind
}
