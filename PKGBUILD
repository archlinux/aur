# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Nick Vogel <vogelrn+aur@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-clojure-mode
pkgver=5.7.0
pkgrel=1
arch=('any')
pkgdesc="Emacs major mode for the clojure language"
url="https://github.com/clojure-emacs/clojure-mode"
license=('GPL3')
depends=('emacs')
optdepends=('paredit: enhanced LISP structure editing')
install=$pkgname.install
source=("${pkgname#emacs-}-clojure-mode-$pkgver.tar.gz::https://github.com/clojure-emacs/clojure-mode/archive/${pkgver}.tar.gz")
sha256sums=('6eaf0a8a9fc2361fdac2e0b49dde2e988ece7df2891818110992442e235e5619')

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
