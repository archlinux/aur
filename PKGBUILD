# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="flycheck"
_gitrepo="flycheck"

pkgname=emacs-flycheck-git
pkgver=31.194.gbaf96df4
pkgrel=1
pkgdesc="On the fly syntax checking for GNU Emacs"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-pkg-info')
makedepends=('git')
provides=('flycheck' 'emacs-flycheck')
conflicts=('flycheck' 'emacs-flycheck')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  git describe --tags | tr - .
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
