# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=cider
_pkgmaintainer=clojure-emacs
_pkgdestdirname=cider
_versionprefix=v
pkgver=0.21.0r11.g62134b4f
pkgrel=1
pkgdesc="The Clojure Interactive Development Environment that Rocks for Emacs"
pkgname=emacs-${_pkgdestdirname}-git
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('emacs' 'emacs-clojure-mode' 'emacs-pkg-info' 'emacs-queue' 'emacs-spinner' 'emacs-sesman' 'emacs-seq')
source=("git+$url.git")
sha256sums=('SKIP')
install=${pkgname%-git}.install

pkgver() {
  cd ${_pkgsrcname}
  git describe --tags|sed 's+-+r+'|tr - .|cut -c2-
}

build() {
  cd ${_pkgsrcname}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
