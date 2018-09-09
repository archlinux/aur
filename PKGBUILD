# Maintainer: sballert <sballert@posteo.de>

_gituser="ericdanan"
_gitrepo="counsel-projectile"

pkgname=emacs-counsel-projectile-git
pkgver=r170.878f95c
pkgrel=1
pkgdesc="Ivy UI for Projectile"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-swiper' 'emacs-projectile')
makedepends=('git')
provides=('emacs-counsel-projectile')
conflicts=('emacs-counsel-projectile')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  make
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
