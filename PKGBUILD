# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-symbols-mode-git
pkgver=0.3
pkgrel=1
pkgdesc="GNU Emacs major mode for listing symbols from object files"
arch=('any')
url="https://gitorious.org/symbols-mode-el"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=("$pkgname%-git")
conflicts=("$pkgname%-git")
source=("git://gitorious.org/symbols-mode-el/symbols-mode-el.git")
md5sums=('SKIP')
_gitname="symbols-mode"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --tags|sed 's/-/./g')
}

build() {
  cd "$srcdir/$_gitname"
  emacs -batch -q -f batch-byte-compile symbols-mode.el
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 symbols-mode.el \
    $pkgdir/usr/share/emacs/site-lisp/symbols-mode.el
  install -Dm644 symbols-mode.elc \
    $pkgdir/usr/share/emacs/site-lisp/symbols-mode.elc
}
