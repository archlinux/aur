# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-shut-up
pkgver=0.3.2
pkgrel=1
pkgdesc="Elisp library for silencing emacs"
arch=('any')
url="https://github.com/cask/shut-up.git"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cask/${pkgname#emacs-}/archive/v$pkgver.tar.gz")
sha256sums=('a11df31fe160d2ec7e94874e98dca804414f08e6cd9fe7e38ec994359bcc7f26')

build() {
  cd ${pkgname#emacs-}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${pkgname#emacs-}-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
