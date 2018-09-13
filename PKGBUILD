# Maintainer: sballert <sballert@posteo.de>

_gituser="jwiegley"
_gitrepo="emacs-async"

pkgname=emacs-async-git
pkgver=r272.d17c11e
pkgrel=1
pkgdesc="Asynchronous processing in Emacs"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-async')
conflicts=('emacs-async')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/async/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/async/
}
