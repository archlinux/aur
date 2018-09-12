# Maintainer: sballert <sballert@posteo.de>

_gituser="syohex"
_gitrepo="emacs-anzu"

pkgname=emacs-anzu-git
pkgver=r261.e6c56ca
pkgrel=1
pkgdesc="Emacs Port of anzu.vim"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-anzu')
conflicts=('emacs-anzu')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/anzu/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/anzu/
}
