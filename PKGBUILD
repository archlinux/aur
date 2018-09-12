# Maintainer: sballert <sballert@posteo.de>

_gituser="redguardtoo"
_gitrepo="evil-matchit"

pkgname=emacs-evil-matchit-git
pkgver=r151.47894a6
pkgrel=1
pkgdesc="Vim matchit ported into Emacs"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil')
makedepends=('git')
provides=('emacs-evil-matchit')
conflicts=('emacs-evil-matchit')
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
