# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Bailey <nerflad@gmail.com>

pkgname=ocaml-curl
pkgver=0.9.1
pkgrel=4
pkgdesc='OCaml bindings to libcurl'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('ocaml' 'curl>=7.28.0')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
url='https://ygrek.org.ua/p/ocurl'
source=("https://github.com/ygrek/ocurl/archive/${pkgver}.tar.gz")
md5sums=('98dd56308f4ab0859e549232b602a733')

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