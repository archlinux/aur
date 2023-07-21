# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Nick Vogel <vogelrn+aur@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-clojure-mode
pkgver=5.16.0
pkgrel=1
arch=('any')
pkgdesc="Emacs major mode for the clojure language"
url="https://github.com/clojure-emacs/clojure-mode"
license=('GPL3')
depends=('emacs')
optdepends=('paredit: enhanced LISP structure editing')
install=$pkgname.install
source=("${pkgname#emacs-}-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('66c081f028dbad6cfc0ea6ac8aea876f1ef2b0df2194fe96e3cc0a566fbfd454')

build() {
  cd clojure-mode-${pkgver}
  emacs -Q --batch -f batch-byte-compile clojure-mode.el
}

package() {
  cd clojure-mode-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/

  # install the files in directory created above
  install -m644 clojure-mode.el{,c} -t "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 clojure-mode-extra-font-locking.el -t "$pkgdir"/usr/share/emacs/site-lisp/
}
