# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sballert <sballert@posteo.de>

_gituser="magnars"
_gitrepo="dash.el"

pkgname=emacs-dash-git
pkgver=2.16.0.r2.g77f3bf4
pkgrel=1
pkgdesc='A modern list API for Emacs, checked out from git master'
arch=('any')
url="https://github.com/${_gituser}/${_gitrepo}"
license=('GPL')
depends=('emacs')
makedepends=('git')
conflicts=('emacs-dash')
provides=('emacs-dash')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitrepo}"
  git describe --tags | sed 's+-+.r+' | tr - .
}

build() {
  cd "${_gitrepo}"
  emacs -Q -batch -L . -f batch-byte-compile dash{,-functional}.el
}

package() {
  cd "${_gitrepo}"
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -Dm644 dash{,-functional}.{el,elc} "$pkgdir"/usr/share/emacs/site-lisp
  install -Dm644 dash.info "$pkgdir"/usr/share/info/dash.info
}
