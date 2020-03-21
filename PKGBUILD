# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="emacs-lsp"
_gitrepo="lsp-ui"

pkgname=emacs-lsp-ui-git
pkgver=6.2.r40.g134d9b7
pkgrel=1
pkgdesc="UI modules for lsp-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-hydra' 'flycheck' 'emacs-lsp-mode' 'emacs-markdown-mode' 'emacs-spinner')
makedepends=('git')
provides=('emacs-lsp-ui')
conflicts=('emacs-lsp-ui')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  git describe --tags | sed 's+-+.r+' | tr - .
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
