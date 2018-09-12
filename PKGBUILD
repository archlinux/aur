# Maintainer: sballert <sballert@posteo.de>

_gituser="emacs-evil"
_gitrepo="evil-surround"

pkgname=emacs-evil-surround-git
pkgver=r127.2af81ab
pkgrel=1
pkgdesc="you will be surrounded (surround.vim for evil, the extensible vi layer)"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil')
makedepends=('git')
provides=('emacs-evil-surround')
conflicts=('emacs-evil-surround')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

check() {
  cd "$_gitrepo"
  make test
}

build() {
  cd "$_gitrepo"
  make compile
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
