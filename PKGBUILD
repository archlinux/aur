# Maintainer: sballert <sballert@posteo.de>

_gituser="DamienCassou"
_gitrepo="auth-password-store"

pkgname=emacs-auth-source-pass-git
pkgver=r123.3de8bbb
pkgrel=1
pkgdesc="Emacs library for outlines"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'pass')
makedepends=('git')
provides=('emacs-auth-source-pass')
conflicts=('emacs-auth-source-pass')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/auth-source-pass/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/auth-source-pass/
}
