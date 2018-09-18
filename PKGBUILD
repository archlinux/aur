# Maintainer: sballert <sballert@posteo.de>

_gituser="volrath"
_gitrepo="password-store-otp.el"

pkgname=emacs-password-store-otp-git
pkgver=r29.1819cd8
pkgrel=1
pkgdesc="Emacs functions to interact with the pass-otp extension for pass"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-password-store' 'emacs-s' 'pass' 'pass-otp')
makedepends=('git')
provides=('emacs-password-store-otp')
conflicts=('emacs-password-store-otp')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/password-store-otp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/password-store-otp/
}
