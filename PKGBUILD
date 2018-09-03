# Maintainer: sballert <sballert@posteo.de>

_gituser="jaypei"
_gitrepo="emacs-neotree"

pkgname=emacs-neotree-git
pkgver=r359.4f8d80f
pkgrel=1
pkgdesc="A emacs tree plugin like NerdTree for Vim."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-neotree')
conflicts=('emacs-neotree')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/neotree/
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/neotree/icons
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/neotree/
  install -m644 icons/*.xpm "$pkgdir"/usr/share/emacs/site-lisp/neotree/icons/
}
