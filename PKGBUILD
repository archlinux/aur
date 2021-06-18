# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: sballert <sballert@posteo.de>

_gituser="emacs-evil"
_gitrepo="evil-collection"

pkgname=emacs-evil-collection-git
pkgver=r1017.2849c80
pkgrel=1
pkgdesc="A set of keybindings for evil-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil' 'emacs-annalist')
makedepends=('git')
provides=('emacs-evil-collection')
conflicts=('emacs-evil-collection')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . --eval '(setq byte-compile-error-on-warn t evil-want-integration nil)' -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
