# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Nick Vogel <vogelrn+aur@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-clojure-mode-git
pkgver=5.10.0.r20.ge2c6a4a
pkgrel=1
arch=('any')
pkgdesc="Emacs major mode for the clojure language"
url="https://github.com/clojure-emacs/clojure-mode"
license=('GPL3')
depends=('emacs')
optdepends=('paredit: enhanced LISP structure editing')
conflicts=('emacs-clojure-mode')
provides=('emacs-clojure-mode')
install=emacs-clojure-mode.install
source=("emacs-clojure-mode::git+https://github.com/clojure-emacs/clojure-mode.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --tags|sed 's+-+.r+'|tr - .)
}

build() {
  cd ${pkgname%-git}
  emacs -Q --batch -f batch-byte-compile clojure-mode.el
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/

  # install the files in directory created above
  install -m644 clojure-mode.el{,c} -t "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 clojure-mode-extra-font-locking.el -t "$pkgdir"/usr/share/emacs/site-lisp/
}
