# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Bailey <nerflad@gmail.com>

pkgname=ocaml-curl
pkgver=0.9.1
pkgrel=4
pkgdesc='OCaml bindings to libcurl'
url='https://ygrek.org.ua/p/ocurl'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('curl>=7.28.0')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ygrek/ocurl/archive/${pkgver}.tar.gz")
sha256sums=('2b3f8a44321c2e086b6d3bd6da4d9b1f9f4a71cb85a8f64e03af8e042f66de0e')

build() {
  cd "${srcdir}/ocurl-${pkgver}"
  ./configure --prefix /usr
  make
}

package() {
  cd "${srcdir}/ocurl-${pkgver}"
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm 755 "${OCAMLFIND_DESTDIR}/stublibs"
  make install FINDLIB=ocamlfind
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}