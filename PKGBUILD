# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Nick Vogel <vogelrn+aur@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-clojure-mode
pkgver=5.11.0
pkgrel=1
arch=('any')
pkgdesc="Emacs major mode for the clojure language"
url="https://github.com/clojure-emacs/clojure-mode"
license=('GPL3')
depends=('emacs')
optdepends=('paredit: enhanced LISP structure editing')
install=$pkgname.install
source=("${pkgname#emacs-}-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('f732885f077820331d5fe093c039b70dd1a7da4491db08c37bf030bcb6fa9bd3')

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
