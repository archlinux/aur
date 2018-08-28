# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-avy-git
pkgver=r247.157486a
pkgrel=1
pkgdesc="Jump to things in Emacs tree-style"
url="https://github.com/abo-abo/avy"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-avy')
conflicts=('emacs-avy')
source=("git+https://github.com/abo-abo/avy.git")
sha256sums=('SKIP')
_gitname="avy"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  make clean test compile
}

package() {
  cd "$_gitname"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/avy"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/avy/"
}
