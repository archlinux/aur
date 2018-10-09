# Maintainer: sballert <sballert@posteo.de>

_gituser="magicdirac"
_gitrepo="avy-flycheck"

pkgname=emacs-avy-flycheck-git
pkgver=r19.5522f3b
pkgrel=1
pkgdesc="Jump to and fix syntax errors using flycheck with avy interface"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'flycheck' 'emacs-avy')
makedepends=('git')
provides=('emacs-avy-flycheck')
conflicts=('emacs-avy-flycheck')
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
