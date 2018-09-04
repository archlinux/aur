# Maintainer: sballert <sballert@posteo.de>

_gituser="Malabarba"
_gitrepo="aggressive-indent-mode"

pkgname=emacs-aggressive-indent-mode-git
pkgver=r186.8e70039
pkgrel=1
pkgdesc="Emacs minor mode that keeps your code always indented."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-aggressive-indent-mode')
conflicts=('emacs-aggressive-indent-mode')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
