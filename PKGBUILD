# Maintainer: sballert <sballert@posteo.de>

_gituser="syohex"
_gitrepo="emacs-dired-k"

pkgname=emacs-dired-k-git
pkgver=r132.c50e8f7
pkgrel=1
pkgdesc="Highlighting dired buffer like k"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-dired-k')
conflicts=('emacs-dired-k')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . -f batch-byte-compile dired-k.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/dired-k/
  install -m644 dired-k.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/dired-k/
}
