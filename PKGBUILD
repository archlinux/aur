# Maintainer: youngunix
# Maintainer: holos

pkgname=flycheck
pkgver=0.28
pkgrel=1
pkgdesc='Modern on-the-fly syntax checking extension for GNU Emacs'
arch=('any')
url="http://www.flycheck.org/"
license=('GPL')
# groups=('emacs-plugins')
depends=('emacs' 'emacs-dash')
makedepends=('emacs' 'texinfo')
source=("https://github.com/flycheck/flycheck/archive/$pkgver.tar.gz")
sha256sums=('skip')

build() {
  cd "$pkgname-$pkgver"

  emacs --batch -f batch-byte-compile flycheck.el
  makeinfo --force --no-split -o doc/flycheck.info doc/flycheck.texi
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/emacs/site-lisp/flycheck"
  install -Dm644 flycheck.{el,elc} "$pkgdir/usr/share/emacs/site-lisp/flycheck"
  install -Dm644 doc/flycheck.info "$pkgdir/usr/share/info/flycheck.info"
}
