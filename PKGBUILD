# Maintainer: holos

pkgname=flycheck
pkgver=0.23
pkgrel=1
pkgdesc='Modern on-the-fly syntax checking extension for GNU Emacs'
arch=('any')
url="http://flycheck.readthedocs.org/"
license=('GPL')
# groups=('emacs-plugins')
depends=('emacs' 'emacs-dash')
makedepends=('emacs' 'texinfo')
install=flycheck.install
source=("https://github.com/flycheck/flycheck/archive/$pkgver.tar.gz")
sha256sums=('edda4967780f3566842c87b7a5d7f2630be593b9029a7909e5c02f68c82ee9e3')

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
