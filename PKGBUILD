# Maintainer: sballert <sballert@posteo.de>

_gituser="redguardtoo"
_gitrepo="evil-nerd-commenter"

pkgname=emacs-evil-nerd-commenter-git
pkgver=r172.275c95c
pkgrel=1
pkgdesc="Comment/uncomment lines efficiently. Like Nerd Commenter in Vim"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-evil-nerd-commenter')
conflicts=('emacs-evil-nerd-commenter')
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
