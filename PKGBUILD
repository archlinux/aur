# Maintainer: sballert <sballert@posteo.de>

_gituser="victorhge"
_gitrepo="iedit"

pkgname=emacs-iedit-git
pkgver=r245.2ab2e8b
pkgrel=1
pkgdesc="Edit multiple regions simultaneously in a buffer or a region "
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-avy')
makedepends=('git')
provides=('emacs-iedit')
conflicts=('emacs-iedit')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . -f batch-byte-compile iedit{-lib,-rect,}*.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 iedit{-lib,-rect,}.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
