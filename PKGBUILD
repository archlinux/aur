# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-git.el
pkgver=0.1.1
pkgrel=1
pkgdesc="Elisp API for programmatically using Git"
arch=('any')
url="https://github.com/rejeep/git.el.git"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rejeep/${pkgname#emacs-}/archive/v$pkgver.tar.gz")
sha256sums=('61f2b3fc5d706d2a5fd927a8e0ae12ffad6335e7f6f93a17f682cbbd69b871d8')

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
