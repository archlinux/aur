# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Bailey <nerflad@gmail.com>

pkgname=ocaml-curl
pkgver=0.9.1
pkgrel=3
pkgdesc='OCaml bindings to libcurl networking library'
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('ocaml' 'curl>=7.28.0')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
url='https://github.com/ygrek/ocurl'
source=("${url}/releases/download/${pkgver}/ocurl-${pkgver}.tar.gz")
sha256sums=('c65f01913270b674a0ca0f278f91bc1e368d7110e8308084bc2280b43a0bc258')

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
}
