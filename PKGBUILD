# Maintainer: sballert <sballert@posteo.de>

_gituser="syohex"
_gitrepo="emacs-evil-anzu"

pkgname=emacs-evil-anzu-git
pkgver=r23.9bca6ca
pkgrel=1
pkgdesc="anzu for Evil"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-anzu')
makedepends=('git')
provides=('emacs-evil-anzu')
conflicts=('emacs-evil-anzu')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/evil-anzu/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/evil-anzu/
}
