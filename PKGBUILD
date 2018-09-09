# Maintainer: sballert <sballert@posteo.de>

_gituser="myrjola"
_gitrepo="diminish.el"

pkgname=emacs-diminish-git
pkgver=r14.565a983
pkgrel=1
pkgdesc="Diminished modes are minor modes with no modeline display"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-diminish')
conflicts=('emacs-diminish')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/diminish/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/diminish/
}
