# Maintainer: sballert <sballert@posteo.de>

_gituser="bmag"
_gitrepo="imenu-list"

pkgname=emacs-imenu-list-git
pkgver=r44.04f0632
pkgrel=1
pkgdesc="Emacs plugin to show the current buffer's imenu entries in a seperate buffer"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-imenu-list')
conflicts=('emacs-imenu-list')
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
