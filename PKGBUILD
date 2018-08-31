# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-expand-region-git
pkgver=r486.ed32924
pkgrel=1
pkgdesc="Emacs extension to increase selected region by semantic units."
url="https://github.com/magnars/expand-region.el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-expand-region')
conflicts=('emacs-expand-region')
source=("git+https://github.com/magnars/expand-region.el.git")
sha256sums=('SKIP')
_gitname="expand-region.el"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitname"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/expand-region"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/expand-region/"
}
