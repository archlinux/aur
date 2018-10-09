# Maintainer: sballert <sballert@posteo.de>

_gituser="emacs-lsp"
_gitrepo="lsp-ui"

pkgname=emacs-lsp-ui-git
pkgver=r261.d292641
pkgrel=1
pkgdesc="UI modules for lsp-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash' 'flycheck' 'emacs-lsp-mode' 'emacs-markdown-mode')
makedepends=('git')
provides=('emacs-lsp-ui')
conflicts=('emacs-lsp-ui')
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
