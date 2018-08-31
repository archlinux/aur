# Maintainer: sballert <sballert@posteo.de>

_gituser="noctuid"
_gitrepo="lispyville"

pkgname=emacs-lispyville-git
pkgver=r88.8c5fdec
pkgrel=1
pkgdesc="lispy + evil = lispyville"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil' 'emacs-lispy')
makedepends=('git')
provides=('emacs-lispyville')
conflicts=('emacs-lispyville')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  rm lispyville-test.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
