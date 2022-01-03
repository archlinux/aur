# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-screencast-mode-git
pkgver=7.9f342c9
pkgrel=1
pkgdesc="screencasting from within emacs"
arch=('any')
url="https://github.com/esbena/screencast-mode"
license=('GPL')
depends=('emacs' 'recordmydesktop' 'wmctrl')
makedepends=('git')
source=("git+https://github.com/esbena/screencast-mode")
md5sums=('SKIP')
_gitname="screencast-mode"

pkgver() {
  cd $srcdir/$_gitname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  emacs -batch -q -f batch-byte-compile screencast-mode.el
}

package() {
  cd "$srcdir/$_gitname"
  install -d $pkgdir/usr/share/emacs
  for _i in *.el *.elc
  do
    install -Dm644 ${_i} $pkgdir/usr/share/emacs/${_i}
  done
}
