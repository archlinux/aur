# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-hydra-git
pkgver=r330.87cc74b
pkgrel=1
pkgdesc="Make Emacs bindings that stick around"
url="https://github.com/abo-abo/hydra"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-hydra')
conflicts=('emacs-hydra')
source=("git+https://github.com/abo-abo/hydra.git")
sha256sums=('SKIP')
_gitname="hydra"

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
  install -d "${pkgdir}/usr/share/emacs/site-lisp/hydra"
  install -m644 {hydra-ox,hydra,lv}.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/hydra/"
}
