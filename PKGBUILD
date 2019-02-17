# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-swiper-git
pkgver=0.11.0r35.g22fca55
pkgrel=1
pkgdesc="Ivy - a generic completion frontend for Emacs, Swiper - isearch with an overview, and more."
url="https://github.com/abo-abo/swiper"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-swiper')
conflicts=('emacs-swiper')
source=("emacs-swiper::git+https://github.com/abo-abo/swiper.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's+-+r+' | tr - .
}

build() {
  cd "${pkgname%-git}"
  make clean test compile
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
