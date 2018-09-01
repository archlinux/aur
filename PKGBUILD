# Maintainer: sballert <sballert@posteo.de>

_gituser="emacs-evil"
_gitrepo="evil"

pkgname=emacs-evil-git
pkgver=r2099.3d9f76f
pkgrel=1
pkgdesc="The extensible vi layer for Emacs."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-goto-chg' 'emacs-undo-tree')
makedepends=('git')
provides=('emacs-evil')
conflicts=('emacs-evil')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  make
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
