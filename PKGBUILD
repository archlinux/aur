# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-syslog
pkgver=1.4
pkgrel=1
pkgdesc="syslog(3) routines for OCaml"
arch=('x86_64')
url="http://homepage.mac.com/letaris"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://archive.org/download/syslog-${pkgver}/syslog-${pkgver}.tar.gz")
md5sums=('3042185e6f511aea9956cd8f172b1a84')

build() {
  cd "${srcdir}/syslog-${pkgver}"

  # Fix compilation with OCaml>=4.06 by restoring default behaviour of <4.06
  export OCAMLFLAGS="-unsafe-string"
  make reallyall
}

package() {
  cd "${srcdir}/syslog-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
}
