# Maintainer: sballert <sballert@posteo.de>

_gituser="Fuco1"
_gitrepo="smartparens"

pkgname=emacs-smartparens-git
pkgver=r1417.14a4d62
pkgrel=1
pkgdesc="Minor mode for Emacs that deals with parens pairs and tries to be smart about"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash')
makedepends=('git')
provides=('emacs-smartparens')
conflicts=('emacs-smartparens')
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
