# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-jedi
pkgver=0.2.7
pkgrel=5
pkgdesc="Python auto-completion for Emacs"
url="https://github.com/tkf/emacs-jedi"
arch=('any')
license=('GPL3')
depends=('emacs' 'python-jedi' 'emacs-auto-complete' 'emacs-epc' 'emacs-python-environment' 'python-virtualenv')
makedepends=('git')
provides=('emacs-jedi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkf/emacs-jedi/archive/v$pkgver.tar.gz")
sha256sums=('adb41035a57bf8edf0d1a2fc309e0c7577e1f797a6e325ae68c1ec6d316c4d9b')

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
