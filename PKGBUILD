# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="tigersoldier"
_gitrepo="company-lsp"

pkgname=emacs-company-lsp-git
pkgver=2.1.0r0.g4eb6949
pkgrel=1
pkgdesc="Company completion backend for lsp-mod"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-company-mode' 'emacs-dash' 'emacs-lsp-mode' 'emacs-s')
makedepends=('git')
provides=('emacs-company-lsp')
conflicts=('emacs-company-lsp')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  git describe --tags --long | sed 's+-+r+' | tr - .
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
