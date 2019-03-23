# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-hydra-git
pkgver=0.14.0r38.g9c4a471
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
  git describe --tags | sed 's+-+r+' | tr - .
}

build() {
  cd "$_gitname"
  make clean test compile
}

package() {
  cd "$_gitname"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 {hydra-ox,hydra,lv}.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
