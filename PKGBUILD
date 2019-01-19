# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="flycheck"
_gitrepo="flycheck-pos-tip"

pkgname=emacs-flycheck-pos-tip-git
pkgver=0.3.6.g9091139
pkgrel=1
pkgdesc="Flycheck errors display in tooltip"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-flycheck' 'emacs-pos-tip')
makedepends=('git')
provides=('emacs-flycheck-pos-tip')
conflicts=('emacs-flycheck-pos-tip')
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
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
