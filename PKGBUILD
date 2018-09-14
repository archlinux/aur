# Maintainer: sballert <sballert@posteo.de>

_gituser="emacs-evil"
_gitrepo="evil-magit"

pkgname=emacs-evil-magit-git
pkgver=r125.9e2275b
pkgrel=1
pkgdesc="Black magic or evil keys for magit "
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil' 'emacs-magit')
makedepends=('git')
provides=('emacs-evil-magit')
conflicts=('emacs-evil-magit')
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
