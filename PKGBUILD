# Maintainer: sballert <sballert@posteo.de>

_gituser="d12frosted"
_gitrepo="flyspell-correct"

pkgname=emacs-flyspell-correct-ivy-git
pkgver=r70.0486912
pkgrel=1
pkgdesc="This package provides ivy interface for flyspell-correct package."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-flyspell-correct')
makedepends=('git')
provides=('emacs-flyspell-correct-ivy')
conflicts=('emacs-flyspell-correct-ivy')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . -f batch-byte-compile flyspell-correct-ivy.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 flyspell-correct-ivy.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
