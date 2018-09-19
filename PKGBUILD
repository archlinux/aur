# Maintainer: sballert <sballert@posteo.de>

_gituser="expez"
_gitrepo="evil-smartparens"

pkgname=emacs-evil-smartparens-git
pkgver=r96.026d4a3
pkgrel=1
pkgdesc="Evil integration for Smartparens"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil' 'emacs-smartparens')
makedepends=('git')
provides=('emacs-evil-smartparens')
conflicts=('emacs-evil-smartparens')
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
