# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

pkgname=ocaml-inotify
pkgver=2.3
pkgrel=1
pkgdesc="OCaml bindings for the inotify API"
arch=('i686' 'x86_64')
url="https://github.com/whitequark/ocaml-inotify"
license=('LGPL2.1')
depends=('ocaml')
optdepends=('ocaml-lwt: For the Lwt wrapper')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-lwt')
options=('!strip' 'staticlibs')
source=("https://github.com/whitequark/ocaml-inotify/archive/v${pkgver}.tar.gz")
sha256sums=('5965cf74c2f3245260d8f22c6ef7d9a9a81a09d542cc651ca25c71fbd60f7f4e')

build() {
  cd "${srcdir}/ocaml-inotify-${pkgver}"

  ./configure --enable-lwt
  make
}

package() {
  cd "${srcdir}/ocaml-inotify-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}/stublibs"
  make install
}
