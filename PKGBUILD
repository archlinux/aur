# Maintainer: sballert <sballert@posteo.de>

_gituser="ecraven"
_gitrepo="ivy-pass"

pkgname=emacs-ivy-pass-git
pkgver=r13.5b523de
pkgrel=1
pkgdesc="ivy interface for pass"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-swiper' 'emacs-password-store')
makedepends=('git')
provides=('emacs-ivy-pass')
conflicts=('emacs-ivy-pass')
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
