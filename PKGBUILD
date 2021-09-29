# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
epoch=2
pkgver=2018.10.15 # Taken from icicles.el
pkgrel=1
pkgdesc="an emacs library that enhances minibuffer completion"
arch=('any')
url="https://github.com/emacsmirror/icicles.git"
depends=('emacs-bookmarkplus' 'emacs-hexrgb')
license=('GPL')
makedepends=('git')
_base_url=https://www.emacswiki.org/emacs/download/
source=("git+https://github.com/emacsmirror/icicles.git#commit=9e9c37d2a54771c635d00d1fe171cef5eab4d95d")
sha256sums=('SKIP')

pkgver() {
  cd icicles
  echo $(awk '/Version/ {print $3}' icicles.el) 
}

build() {
  cd icicles
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  cd icicles
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/
  cp -r *{.el,.elc} "$pkgdir"/usr/share/emacs/site-lisp/
}
