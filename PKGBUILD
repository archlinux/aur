# Maintainer: sballert <sballert@posteo.de>

_gituser="hlissner"
_gitrepo="emacs-doom-themes"

pkgname=emacs-doom-themes-git
pkgver=r765.3769bf2
pkgrel=1
pkgdesc="An opinionated pack of modern color-themes"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' "emacs-all-the-icons")
makedepends=('git')
provides=('emacs-doom-themes')
conflicts=('emacs-doom-themes')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el themes/*.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/themes/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 themes/*.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/themes/
}
