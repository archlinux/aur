# Maintainer: Axium <AxiumIxane@protonmail.com>

pkgname=emacs-cond-let
_pkgname=cond-let
pkgver=0.2.2
pkgrel=1
pkgdesc='Additional and improved binding conditionals for Emacs Lisp'
arch=('any')
url='https://github.com/tarsius/cond-let'
license=('GPL-3.0-or-later')
depends=('emacs')
source=("${pkgname}-${pkgver}.tar::https://elpa.nongnu.org/nongnu/${_pkgname}-${pkgver}.tar")
sha256sums=('fecf17c450d988e207925735a168676608b233ea8a4866d8fc01bf06259ae546')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  emacs -Q --batch -L . -f batch-byte-compile cond-let.el
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  emacs -Q --batch -L . --eval "(require 'cond-let)"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/emacs/site-lisp"
  install -m644 cond-let.el "${pkgdir}/usr/share/emacs/site-lisp/"

  shopt -s nullglob
  install -m644 cond-let.elc "${pkgdir}/usr/share/emacs/site-lisp/"
}
