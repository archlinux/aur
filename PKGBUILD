# Maintainer: sballert <sballert@posteo.de>

_gituser="NicolasPetton"
_gitrepo="pass"

pkgname=emacs-pass-git
pkgver=r81.da08fed
pkgrel=1
pkgdesc="A major mode for password-store"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-password-store' 'emacs-f' 'emacs-password-store-otp')
makedepends=('git')
provides=('emacs-pass')
conflicts=('emacs-pass')
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
