# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ag-git
pkgver=0.47r49.g77b4f50
pkgrel=1
pkgdesc="An Emacs frontend to The Silver Searcher (binary name ag)"
arch=('any')
url="https://github.com/Wilfred/ag.el"
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-s')
makedepends=('git')
provides=('emacs-ag')
conflicts=('emacs-ag')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ag.el
  git describe --tags | sed 's+-+r+' | tr - .
}

build() {
  cd ag.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ag.el
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
