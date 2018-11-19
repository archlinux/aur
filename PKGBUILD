# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-exwm-git
pkgver=r425.786c2b4
pkgrel=1
pkgdesc="Use emacs as windowmanager"
arch=('any')
url="https://github.com/ch11ng/exwm.git"
license=('GPL')
depends=('emacs-xelb')
makedepends=('git')
provides=('emacs-exwm')
conflicts=('emacs-exwm')
source=("git+https://github.com/ch11ng/exwm.git")
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
  install -Dm644 README.md "$pkgdir"/usr/share/doc/emacs-exwm/README.md
  install -Dm644 xinitrc "$pkgdir"/usr/share/doc/emacs-exwm/sample-xinitrc
}
