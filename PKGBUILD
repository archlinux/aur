# Maintainer: Eric Bailey <nerflad@gmail.com>
pkgname=ocaml-curl
pkgver=0.8.2
pkgrel=1
pkgdesc="OCaml bindings to libcurl networking library"
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('ocaml' 'curl>=7.28.0')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
url='https://github.com/ygrek/ocurl'
source=("${url}/releases/download/${pkgver}/ocurl-${pkgver}.tar.gz")
sha256sums=('09830f496aea805ecd4593834acc51852803ebe336650eda793facf769eba3ab')

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
