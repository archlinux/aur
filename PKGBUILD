# Maintainer: sballert <sballert@posteo.de>

_gituser="abo-abo"
_gitrepo="lispy"

pkgname=emacs-lispy-git
pkgver=r2095.0530371
pkgrel=1
pkgdesc="Short and sweet LISP editing"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-ace-window' 'emacs-hydra' 'emacs-iedit' 'emacs-swiper' 'emacs-zoutline')
makedepends=('git')
provides=('emacs-lispy')
conflicts=('emacs-lispy')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  rm -f lispy-test.el elpa.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
