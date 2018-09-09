# Maintainer: sballert <sballert@posteo.de>

_gituser="bbatsov"
_gitrepo="projectile"

pkgname=emacs-projectile-git
pkgver=r1591.62ef2ae
pkgrel=1
pkgdesc="Project Interaction Library for Emacs"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-pkg-info')
makedepends=('git')
provides=('emacs-projectile')
conflicts=('emacs-projectile')
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
