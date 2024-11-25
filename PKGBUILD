# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-exwm-git
pkgver=r666.369b417
pkgrel=1
pkgdesc="Use emacs as windowmanager"
arch=('any')
url="https://github.com/emacs-exwm/exwm.git"
license=('GPL')
depends=('emacs-xelb-git')
makedepends=('git')
provides=('emacs-exwm')
conflicts=('emacs-exwm')
source=("git+https://github.com/emacs-exwm/exwm.git")
md5sums=('SKIP')
_gitname="exwm"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  cd "$_gitname"
  for _i in *.el
  do
    install -Dm644 ${_i} "$pkgdir"/usr/share/emacs/site-lisp/exwm/${_i}
  done
}
