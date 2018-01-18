# Contributor: XeCycle <xecycle@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-calfw-git
pkgver=20180118.03abce9
pkgrel=2
pkgdesc="A calendar framework for Emacs"
url="https://github.com/kiwanami/emacs-calfw"
arch=('any')
license=('GPL')
depends=('emacs')
install=emacs-calfw-git.install
source=(git://github.com/kiwanami/emacs-calfw.git)
md5sums=('SKIP')
_gitname=emacs-calfw

pkgver() {
  cd $_gitname
  git log -1 --format='%cd.%h' --date=short | tr -d -
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
