# Maintainer: sballert <sballert@posteo.de>

_gituser="volrath"
_gitrepo="treepy.el"

pkgname=emacs-treepy-git
pkgver=r37.b40e6b0
pkgrel=1
pkgdesc="Generic tree traversing tools for Emacs Lisp"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-treepy')
conflicts=('emacs-treepy')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/treepy/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/treepy/
}
