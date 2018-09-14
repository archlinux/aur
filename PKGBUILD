# Maintainer: sballert <sballert@posteo.de>

_gituser="magit"
_gitrepo="ghub"

pkgname=emacs-ghub-git
pkgver=r230.440a563
pkgrel=1
pkgdesc="Client libraries for the APIs of various Git forges"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-graphql' 'emacs-treepy')
makedepends=('git')
provides=('emacs-ghub')
conflicts=('emacs-ghub')
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
