# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: oliver < a t >  first . in-berlin . de

set -u
pkgname='camlpdf'
#_pkgver='2.5.1'
#_pkgver='2.5.3'
#_pkgver='2.6.1'
#_pkgver='2.6.2'
_pkgver='2.7.1'
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
md5sums=('5ec4c14006769e68be97a3ed70d46bc7')
sha256sums=('601aa26ef173ce1478128383124fc92d087f173d03b40846607d2d8667dbb784')

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
