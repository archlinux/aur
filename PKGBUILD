# Maintainer: Axium <AxiumIxane@protonmail.com>

pkgname=emacs-cond-let
_pkgname=cond-let
pkgver=1.1.2
pkgrel=1
pkgdesc='Additional and improved binding conditionals for Emacs Lisp'
arch=('any')
url='https://github.com/tarsius/cond-let'
license=('GPL-3.0-or-later')
depends=('emacs')
source=("${pkgname}-${pkgver}.tar.lz::https://elpa.nongnu.org/nongnu/${_pkgname}-${pkgver}.tar.lz")
sha256sums=('c27f8163daa1f1d48918e6190562d8fd01b315ca6d4ea15b5ceac4ba4680e614')

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
