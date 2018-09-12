# Maintainer: sballert <sballert@posteo.de>

_gituser="Bad-ptr"
_gitrepo="persp-mode.el"

pkgname=emacs-persp-mode-git
pkgver=r468.cc1d16a
pkgrel=1
pkgdesc="named perspectives(set of buffers/window configs) for emacs"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-persp-mode')
conflicts=('emacs-persp-mode')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/persp-mode/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/persp-mode/
}
