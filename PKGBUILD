# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-jedi
pkgver=0.2.8
pkgrel=1
pkgdesc="Python auto-completion for Emacs"
url="https://github.com/tkf/emacs-jedi"
arch=('any')
license=('GPL3')
depends=('emacs' 'python-jedi' 'emacs-auto-complete' 'emacs-epc' 'emacs-python-environment' 'python-virtualenv')
makedepends=('git')
provides=('emacs-jedi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkf/emacs-jedi/archive/v$pkgver.tar.gz")
sha256sums=('f97884ef3016146a0f0323e23b348066a253cbe780f03e952a209fd96aa4bcd9')

build() {
  cd emacs-jedi-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile jedi*.el
}

package() {
  cd emacs-jedi-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/jedi
  install -m644 jedi*.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/jedi/
  install -m755 jedi*.py "$pkgdir"/usr/share/emacs/site-lisp/jedi/
}
