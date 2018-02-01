# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Nick Vogel <vogelrn+aur@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-clojure-mode
pkgver=5.6.1
pkgrel=1
arch=('any')
pkgdesc="Emacs major mode for the clojure language"
url="https://github.com/clojure-emacs/clojure-mode"
license=('GPL3')
depends=('emacs')
optdepends=('paredit: enhanced LISP structure editing')
install=$pkgname.install
source=("${pkgname#emacs-}-clojure-mode-$pkgver.tar.gz::https://github.com/clojure-emacs/clojure-mode/archive/${pkgver}.tar.gz")
sha256sums=('08e1101519bdcb65a7b4c2729f6ed6d15a42ce75b81efb2381cf17cf2c0c93b8')

build() {
  cd clojure-mode-${pkgver}
  emacs -Q --batch -f batch-byte-compile clojure-mode.el
}

package() {
  cd clojure-mode-${pkgver}
  install -d "${pkgdir}/usr/share/emacs/site-lisp/"

  # install the files in directory created above
  install -m644 clojure-mode.el{,c} -t "${pkgdir}/usr/share/emacs/site-lisp/"
  install -m644 clojure-mode-extra-font-locking.el -t "${pkgdir}/usr/share/emacs/site-lisp/"
}
