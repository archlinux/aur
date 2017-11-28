# Maintainer: Eric Bailey <nerflad@gmail.com>
pkgname=ocaml-curl
pkgver=0.8.0
pkgrel=1
pkgdesc="OCaml bindings to libcurl networking library"
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('ocaml' 'curl>=7.9.8')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
url='https://github.com/ygrek/ocurl'
source=("${url}/releases/download/${pkgver}/ocurl-${pkgver}.tar.gz")
sha256sums=('99935feb1e7ff6456e33452888a3671ecb6535a303b006f24203bc54b79d2209')

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
