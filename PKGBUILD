# Maintainer: sballert <sballert@posteo.de>

_gituser="thierryvolpiatto"
_gitrepo="eldoc-eval"

pkgname=emacs-eldoc-eval-git
pkgver=r41.f59a1ae
pkgrel=1
pkgdesc="Emacs extension that display eldoc info while minibuffer is in use."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-eldoc-eval')
conflicts=('emacs-eldoc-eval')
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
