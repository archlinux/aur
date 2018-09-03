# Maintainer: sballert <sballert@posteo.de>

_gituser="m00natic"
_gitrepo="vlfi"

pkgname=emacs-vlf-git
pkgver=r305.31b292d
pkgrel=1
pkgdesc="View Large Files in Emacs"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-vlf')
conflicts=('emacs-vlf')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/vlf/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/vlf/
}
