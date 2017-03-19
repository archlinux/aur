# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ppx_tools
pkgname=ocaml-${_pkgname}
_pkgver=5.0
_ocamlver=4.04.0
pkgver=${_pkgver}+${_ocamlver}
pkgrel=1
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools"
arch=('i686' 'x86_64')
url="https://github.com/alainfrisch/ppx_tools"
license=('MIT')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("https://github.com/alainfrisch/${_pkgname}/archive/${_pkgver}.tar.gz"
        "https://github.com/alainfrisch/ppx_tools/commit/881a4826a4da482ceeca262950c5a8a0ca4e11d4.patch"
        "https://github.com/alainfrisch/ppx_tools/commit/f70ca1d07d565989a0041e312e8efc00ff2ad87e.patch")
md5sums=('0ebba4648f519665c91450081cde976a'
         'eeccea12d66b3b3642f75a17cb9636f2'
         'bb622110bf23d30e9022e4bf915a5524')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  # Fix compilation with OCaml 4.04
  patch -Np1 < "${srcdir}/881a4826a4da482ceeca262950c5a8a0ca4e11d4.patch"
  patch -Np1 < "${srcdir}/f70ca1d07d565989a0041e312e8efc00ff2ad87e.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}"
  make install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
