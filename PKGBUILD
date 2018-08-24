# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-all-the-icons-ivy-git
pkgver=r21.789e335
pkgrel=1
pkgdesc="all-the-icons.el for Ivy/Counsel"
arch=('any')
url="https://github.com/asok/all-the-icons-ivy"
license=('GPL3')
depends=('emacs-all-the-icons')
makedepends=('git')
provides=('emacs-all-the-icons-ivy.el')
source=("git+https://github.com/asok/all-the-icons-ivy.git")
md5sums=('SKIP')
_gitname="all-the-icons-ivy"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  emacs -batch -L . -f batch-byte-compile *.el || true
}

package() {
  cd $_gitname
  install -d "${pkgdir}/usr/share/emacs/site-lisp/all-the-icons-ivy"
  install -m644 all-the-icons-ivy.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/all-the-icons-ivy/"
}
