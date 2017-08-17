# Maintainer: Eric Bailey <nerflad@gmail.com>
pkgname=ocaml-curl
pkgver=0.7.10
pkgrel=1
pkgdesc="OCaml bindings to libcurl networking library"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ocaml' 'curl>=7.9.8')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
url='https://github.com/ygrek/ocurl'
source=("${url}/releases/download/${pkgver}/ocurl-${pkgver}.tar.gz")
sha256sums=('b523edaa9374177ce52dcd2db12221fde71be6e9bf16817f0f583453c8b34a62')

build() {
  cd "$srcdir/ocurl-${pkgver}"
  ./configure --prefix /usr
  make
}

package() {
  cd "$srcdir/ocurl-${pkgver}"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install FINDLIB=ocamlfind
}
