# Maintainer: sballert <sballert@posteo.de>

_gituser="emacs-lsp"
_gitrepo="lsp-python"

pkgname=emacs-lsp-python-git
pkgver=r17.b97688a
pkgrel=1
pkgdesc="Python support for lsp-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-lsp-mode')
makedepends=('git')
provides=('emacs-lsp-python')
conflicts=('emacs-lsp-python')
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
