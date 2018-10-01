# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus
pkgver=2018.09.21
pkgrel=1
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
md5sums=('a489d11cc953fd1c5fbc142406129f47'
         '3f5454fb622fa72d7ac966332cb455d3'
         'e8291fdeef6da229c31fa75f05377748'
         'd2e299a523fb0baacf9abcbb239d188f'
         '87a7714bbfa2a8af221a47a403e14010'
         '1ec51bb03315722d2fd6e039de8a6fbb'
         '7a855f04203da76e4bb2547f1dc53044'
         'b940a68fd9619ddd270a99dded0ae4d1')

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
