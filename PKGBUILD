# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: oliver < a t >  first . in-berlin . de

set -u
pkgname='camlpdf'
_pkgver='2.9'
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
md5sums=('ec43131411388cab3ed5e936859497d3')
sha256sums=('2bbc222eb6e1be4ef6ec2900a1bba1da652704ff1343e742726689e077d35a27')

_setvars() {
  _OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  _OCAMLFIND_LDCONF="${pkgdir}/$(ocamlfind printconf ldconf)"
}

build() {
  local -; set -u
  cd "${_srcdir}"

  local _OCAMLFIND_DESTDIR _OCAMLFIND_LDCONF; _setvars
  make -s OCAMLFIND_DESTDIR="${_OCAMLFIND_DESTDIR}"
}

package() {
  local -; set -u
  cd "${_srcdir}"

  local _OCAMLFIND_DESTDIR _OCAMLFIND_LDCONF; _setvars
  install -d "${_OCAMLFIND_DESTDIR}"
  make -s install -d OCAMLFIND_DESTDIR="${_OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${_OCAMLFIND_LDCONF}"
}
set +u
