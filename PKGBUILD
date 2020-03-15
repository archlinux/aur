# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=arch-xlicense
_pkgmaintainer=stefanhusmann
pkgver=0.1
pkgrel=1
pkgdesc="lib for handling licences in emacs"
pkgname=emacs-arch-xlicense-git
arch=('any')
url="https://gitlab.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgsrcname}
  git describe --tags | sed s+-+.r+ | tr - .
}

build() {
  cd ${_pkgsrcname}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp
}
