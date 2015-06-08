# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-dash-git
pkgver=2.10.0.55.g7aec562
pkgrel=1
pkgdesc='A modern list API for Emacs. No cl required'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
depends=('emacs')
makedepends=('git')
conflicts=('emacs-dash')
provides=('emacs-dash')
source=('git+https://github.com/magnars/dash.el')
sha256sums=('SKIP')

pkgver() {
  cd 'dash.el'
  git describe --tags | sed 's/-/./g'
}

build() {
  cd 'dash.el'

  # byte compile
  emacs -batch -f batch-byte-compile dash.el
  emacs -batch -l dash.elc -f batch-byte-compile dash-functional.el
}

package() {
  cd 'dash.el'

  # create destination path
  install -d "$pkgdir/usr/share/emacs/site-lisp/dash"

  # copy over files into path
  install -Dm644 *.el *.elc "$pkgdir/usr/share/emacs/site-lisp/dash"
}
