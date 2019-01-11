# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=squiggly-clojure
_pkgmaintainer=clojure-emacs
_pkgdestdirname=flycheck-clojure
_versionprefix=
_elispsubdir=/elisp/flycheck-clojure/
pkgver=0.1.5
pkgrel=2
pkgdesc="squiggly-clojure: Flycheck checker for Clojure, using eastwood and core.typed."
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-cider' 'flycheck' 'leiningen')
optdepends=('emacs-flycheck-pos-tip: Floating messages at point (to avoid convolluting eldoc information from cider)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('7ddc97c028a91512c16613e1b4ac88c97873ef5dae729cb06dfadd341c4ef190')
install=${pkgname}.install

build() {
  cd ${_pkgsrcname}-${pkgver}${_elispsubdir}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}-${pkgver}${_elispsubdir}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
