# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: oliver < a t >  first . in-berlin . de

set -u
pkgname='camlpdf'
#_pkgver='2.1.1'
#_pkgver='2.2'
#_pkgver='2.2precrypt'
#_pkgver='2.2-patchlevel1'
#_pkgver='2.3'
#_pkgver='2.3.1'
_pkgver='2.4'
pkgver="${_pkgver//atchlevel/}"
pkgver="${pkgver//-/.}"
pkgrel='1'
pkgdesc='Coherent Graphics OCaml library for reading, writing and modifying PDF files'
arch=('i686' 'x86_64')
url="https://github.com/johnwhitington/camlpdf"
license=('LGPL')
depends=('glibc')
makedepends=('ocaml-findlib')
options=('!makeflags' 'staticlibs')
_srcdir="camlpdf-${_pkgver}"
source=("${_srcdir}.tar.gz::https://github.com/johnwhitington/camlpdf/archive/v${_pkgver}.tar.gz")
md5sums=('7bac3bff86e5580eba2b76d4d4d6be15')
sha256sums=('f98f5cc080ffb088028ee607ffada3020aaebee0aee04a4bb2a6273c84f21c9c')

_setvars() {
  OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  OCAMLFIND_LDCONF="${pkgdir}/$(ocamlfind printconf ldconf)"
}

build() {
  set -u
  cd "${_srcdir}"

  local OCAMLFIND_DESTDIR OCAMLFIND_LDCONF; _setvars
  make -s OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  local OCAMLFIND_DESTDIR OCAMLFIND_LDCONF; _setvars
  install -d "${OCAMLFIND_DESTDIR}"
  make -s install -d OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${OCAMLFIND_LDCONF}"
  set +u
}
set +u
