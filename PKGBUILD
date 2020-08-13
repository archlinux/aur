# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Nick Vogel <vogelrn+aur@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-clojure-mode
pkgver=5.12.0
pkgrel=1
arch=('any')
pkgdesc="Emacs major mode for the clojure language"
url="https://github.com/clojure-emacs/clojure-mode"
license=('GPL3')
depends=('emacs')
optdepends=('paredit: enhanced LISP structure editing')
install=$pkgname.install
source=("${pkgname#emacs-}-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('7c54940619456ad308c2c55026e8ec792d01ae3c7f3498507f1eb0a1dac5fb9c')

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
