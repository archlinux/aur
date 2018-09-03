# Maintainer: sballert <sballert@posteo.de>

_gituser="jtbm37"
_gitrepo="all-the-icons-dired"

pkgname=emacs-all-the-icons-dired-git
pkgver=r31.980b774
pkgrel=1
pkgdesc="Adds dired support to all-the-icons"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-all-the-icons')
makedepends=('git')
provides=('emacs-all-the-icons-dired')
conflicts=('emacs-all-the-icons-dired')
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
