# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-j-mode-git
pkgver=1.1.1.2.gcf27446
pkgrel=1
pkgdesc="Emacs-mode for the J language"
arch=('any')
url="https://github.com/zellio/j-mode"
license=('GPL3')
makedepends=('git')
provides=('emacs-j-mode')
conflicts=('emacs-j-mode')
install=$pkgname.install
source=("git://github.com/zellio/j-mode.git")
md5sums=('SKIP')
_gitname="j-mode"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's|-|.|g' |sed 's+^v++'
}

build() {
  cd "$srcdir/$_gitname"
  for _i in *.el 
  do
    emacs --batch -q --eval "(byte-compile-file \"${_i}\")"
  done
}

package() {
  cd "$srcdir/$_gitname"
  for _i in *.el *.elc
  do
    install -Dm644 ${_i} "$pkgdir"/usr/share/emacs/site-lisp/${_i}
  done 
}
