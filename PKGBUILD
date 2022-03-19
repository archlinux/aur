# Contributor: XeCycle <xecycle@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: A Frederick Christensen <aur@nosocomia.com>

pkgname=emacs-calfw-git
pkgver=1.6.r35.g8ff7e75
pkgrel=1
pkgdesc="A calendar framework for Emacs"
url="https://github.com/kiwanami/emacs-calfw"
arch=('any')
license=('GPL')
depends=('emacs')
install=emacs-calfw-git.install
source=(git+https://github.com/kiwanami/emacs-calfw.git)
md5sums=('SKIP')
_gitname=emacs-calfw

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | tr -d v
}

build() {
  cd $_gitname
  for file in calfw{,-cal,-ical,-org}.el; do
    emacs -Q --batch -l calfw.el -f batch-byte-compile $file
  done
}

package() {
  cd $_gitname
  el_dir=/usr/share/emacs/site-lisp/
  doc_dir=/usr/share/doc/emacs-calfw
  install -m 755 -d "$pkgdir"{$el,$doc}_dir
  install -m 644 -t "$pkgdir"$el_dir *.el{,c}
  install -m 644 -t "$pkgdir"$doc_dir readme.md
}
