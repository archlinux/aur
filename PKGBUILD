# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: oliver < a t >  first . in-berlin . de

set -u
pkgname='camlpdf'
#_pkgver='2.5.1'
#_pkgver='2.5.3'
#_pkgver='2.6.1'
#_pkgver='2.6.2'
#_pkgver='2.7.1'
_pkgver='2.8'
pkgver="${_pkgver//atchlevel/}"
pkgver="${pkgver//-/.}"
pkgrel='1'
pkgdesc='Coherent Graphics OCaml library for reading, writing and modifying PDF files'
arch=('i686' 'x86_64')
url="https://github.com/johnwhitington/camlpdf"
license=('LGPL-2.1-or-later')
depends=('glibc')
makedepends=('ocaml-findlib')
options=('!makeflags' 'staticlibs')
_srcdir="camlpdf-${_pkgver}"
source=("${_srcdir}.tar.gz::https://github.com/johnwhitington/camlpdf/archive/v${_pkgver}.tar.gz")
md5sums=('878c5f0e655bc101eb4c43c04843b8af')
sha256sums=('ab7752bfc3f28f3fc75e4d0d46bab1de254a212adf0c01c146db44efc2659efd')

_setvars() {
  _OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  _OCAMLFIND_LDCONF="${pkgdir}/$(ocamlfind printconf ldconf)"
}

build() {
  set -u
  cd "${_srcdir}"

  local _OCAMLFIND_DESTDIR _OCAMLFIND_LDCONF; _setvars
  make -s OCAMLFIND_DESTDIR="${_OCAMLFIND_DESTDIR}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  local _OCAMLFIND_DESTDIR _OCAMLFIND_LDCONF; _setvars
  install -d "${_OCAMLFIND_DESTDIR}"
  make -s install -d OCAMLFIND_DESTDIR="${_OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${_OCAMLFIND_LDCONF}"
  set +u
}
set +u
