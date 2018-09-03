# Maintainer: sballert <sballert@posteo.de>

_gituser="alpaker"
_gitrepo="Fill-Column-Indicator"

pkgname=emacs-fill-column-indicator-git
pkgver=r145.d2536b1
pkgrel=1
pkgdesc="An Emacs minor mode that graphically indicates the fill column."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-fill-column-indicator')
conflicts=('emacs-fill-column-indicator')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/fill-column-indicator/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/fill-column-indicator/
}
