# Maintainer: Axium <AxiumIxane@protonmail.com>

pkgname=emacs-llama
_pkgname=llama
pkgver=1.0.4
pkgrel=1
pkgdesc='Compact syntax for short lambda in Emacs Lisp'
arch=('any')
url='https://github.com/tarsius/llama'
license=('GPL-3.0-or-later')
depends=('emacs' 'emacs-compat')
source=("${pkgname}-${pkgver}.tar::https://elpa.nongnu.org/nongnu/${_pkgname}-${pkgver}.tar")
sha256sums=('f0749ee17da0ec37eb76f6fe54baa73539754554dc6b7d2dc9c4a133995eb94f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  emacs -Q --batch \
    -L . \
    -L /usr/share/emacs/site-lisp \
    -f batch-byte-compile llama.el
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  emacs -Q --batch \
    -L . \
    -L /usr/share/emacs/site-lisp \
    --eval "(require 'llama)"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/emacs/site-lisp"

  shopt -s nullglob
  install -m644 llama.el llama.elc "${pkgdir}/usr/share/emacs/site-lisp/"
}
