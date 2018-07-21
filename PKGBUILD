# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus
pkgver=2017.03.31
pkgrel=2
pkgdesc="Bookmark+ package, which enhances vanilla Emacs bookmarks in many ways"
url="http://www.emacswiki.org/emacs/BookmarkPlus"
license=('GPL3')
arch=('any')
depends=('emacs')
conflicts=('emacs-bookmarkplus-mode')
provides=('emacs-bookmarkplus-mode')
makedepends=('awk')
source=("http://www.emacswiki.org/emacs/download/bookmark+.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-mac.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-bmu.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-1.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-key.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-lit.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-doc.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-chg.el")
md5sums=('649ecbd6a757b52591f79502c0ff2ee2'
         '3f5454fb622fa72d7ac966332cb455d3'
         '9ef4349577df93d171cc40d117d9d30c'
         'ef4c8ad4325d8e8308878de76fb8fbff'
         '87a7714bbfa2a8af221a47a403e14010'
         '38f2c1678ac262fc9aad36d1d98d97d2'
         '7a855f04203da76e4bb2547f1dc53044'
         '24b9af53610e7fdcb60fb45e8eee1040')

pkgver() {
  awk '/Version/ {print $3}' bookmark+.el
}

build() {
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  install -dm755 "${pkgdir}"/usr/share/emacs/site-lisp/
  install -Dm644 *.el{,c} "${pkgdir}"/usr/share/emacs/site-lisp/
}
