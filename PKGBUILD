# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-swiper-git
pkgver=r1938.02537c9
pkgrel=1
pkgdesc="Ivy - a generic completion frontend for Emacs, Swiper - isearch with an overview, and more. Oh, man!"
url="https://github.com/abo-abo/swiper"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-swiper')
conflicts=('emacs-swiper')
source=("git+https://github.com/abo-abo/swiper.git")
sha256sums=('SKIP')
_gitname="swiper"

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
  install -d "${pkgdir}/usr/share/emacs/site-lisp/swiper"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/swiper/"
}
