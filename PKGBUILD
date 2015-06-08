# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus-mode
pkgver=2013.07.23
pkgrel=1
pkgdesc="Bookmark+ mode, which enhances vanilla Emacs bookmarks in many ways"
url="http://www.emacswiki.org/emacs/BookmarkPlus"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('awk')
install=emacs-bookmarkplus-mode.install
source=("http://www.emacswiki.org/emacs/download/bookmark+.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-mac.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-bmu.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-1.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-key.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-lit.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-doc.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-chg.el")
md5sums=('641cc94ac319257bd06b26f5cf27c720'
         '667e07d6c6491edc1d4f53a9b10d6ab2'
         '3aa9ecbdac8ac66bb2d686d8ddab7030'
         '291f4998329c6799a114dc1afb1b30d7'
         'cf2d95e1b86d28d2519945b7e4b95af8'
         '6780d705e05edf5f2b23a86f58b9ed6a'
         '36b7bc555064c8183c6bd9ac8a971131'
         '88d15de58484f03621327f43c8037c11')

pkgver() {
  cd $srcdir
  awk '/Version/ {print $3}' bookmark+.el
}

build() {
  cd $srcdir
  for _i in bookmark+.el \
      bookmark+-mac.el bookmark+-1.el \
      bookmark+-key.el bookmark+-lit.el \
      bookmark+-doc.el bookmark+-chg.el 
  do
    emacs -L $srcdir -batch -q -f batch-byte-compile $_i
  done
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/emacs/site-lisp/"
  install -Dm644 *.el{,c} "${pkgdir}/usr/share/emacs/site-lisp/"
}
