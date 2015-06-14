# Contributor: XeCycle <xecycle@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-calfw-git
pkgver=20150610.2dbea8c
pkgrel=1
pkgdesc="A calendar framework for Emacs"
url="https://github.com/kiwanami/emacs-calfw"
arch=('any')
license=('GPL')
depends=('emacs')
#makedepends=('perl-text-markdown') # remove if don't want html doc
install=emacs-calfw-git.install
source=(git://github.com/kiwanami/emacs-calfw.git)
md5sums=('SKIP')
_gitname=emacs-calfw

pkgver() {
  cd $srcdir/$_gitname
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd $srcdir/$_gitname
  for file in calfw{,-cal,-ical,-org}.el; do
    emacs -Q --batch -l calfw.el -f batch-byte-compile $file
  done

  # html doc
#  Markdown.pl readme.md > readme.html
}

package() {
  cd $srcdir/$_gitname
  el_dir=/usr/share/emacs/site-lisp/emacs-calfw
  doc_dir=/usr/share/doc/emacs-calfw
  install -m 755 -d $pkgdir{$el,$doc}_dir
  install -m 644 -t $pkgdir$el_dir *.el{,c}
  install -m 644 -t $pkgdir$doc_dir readme.*
}
