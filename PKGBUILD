# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Flávio Tapajós <tapajos at outlook doc com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Bailey <nerflad@gmail.com>

pkgname=ocaml-curl
pkgver=0.9.2
pkgrel=3
pkgdesc='OCaml bindings to libcurl'
url='https://ygrek.org/p/ocurl'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('curl>=7.28.0')
makedepends=('ocaml-findlib' 'ocaml-lwt')
options=('!strip' '!makeflags' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ygrek/ocurl/archive/${pkgver}.tar.gz")
sha256sums=('dfa55b83f2ba1f32898c3488fd7bfcd55414f4719f563d83d126e5b9de2bd156')

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
