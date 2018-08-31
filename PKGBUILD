# Maintainer: sballert <sballert@posteo.de>

_gituser="syl20bnr"
_gitrepo="evil-iedit-state"

pkgname=emacs-evil-iedit-state-git
pkgver=r21.f75cff4
pkgrel=1
pkgdesc="Slick Evil states for iedit."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil' 'emacs-iedit')
optdepends=('emacs-expand-region: Integration with expand-region')
makedepends=('git')
provides=('emacs-evil-iedit-state')
conflicts=('emacs-evil-iedit-state')
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
