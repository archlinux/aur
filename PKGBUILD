# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-general.el-git
pkgver=r255.6b8f7bc
pkgrel=1
pkgdesc="More convenient key definitions in emacs"
arch=('any')
url="https://github.com/noctuid/general.el"
license=('GPL')
depends=('emacs')
makedepends=('git')
provides=('emacs-general.el')
source=("git+https://github.com/noctuid/general.el.git")
md5sums=('SKIP')
_gitname="general.el"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  cd $_gitname
  install -d "${pkgdir}/usr/share/emacs/site-lisp/general-el"
  install -m644 general.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/general-el/"
}
