# Maintainer: sballert <sballert@posteo.de>

_gituser="bennya"
_gitrepo="shrink-path.el"

pkgname=emacs-shrink-path-git
pkgver=r54.9d06c45
pkgrel=1
pkgdesc="fish-style path truncation in emacs-lisp"
url="https://gitlab.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-f' 'emacs-s')
makedepends=('git')
provides=('emacs-shrink-path')
conflicts=('emacs-shrink-path')
source=("git+https://gitlab.com/${_gituser}/${_gitrepo}.git")
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/shrink-path/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/shrink-path/
}
