# Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=emacs-dash
pkgver=2.10.0
pkgrel=1
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
source=("https://github.com/magnars/dash.el/archive/$pkgver.tar.gz"
        'https://github.com/magnars/dash.el/commit/dab0d1c.patch')
sha256sums=('cf94c9b8b4ef951aebf068172f139d511d71520569c361db73877808981f05fe'
            'e5845b5025e7d7b4d6dfd4619ff3d76c8ec01424b90ab86743baf168d93ec239')

prepare() {
  cd dash.el-"$pkgver"
  patch -p1 < ../dab0d1c.patch
}

build() {
  cd dash.el-"$pkgver"
  emacs -batch -L . -f batch-byte-compile dash{,-functional}.el
}

package() {
  cd dash.el-"$pkgver"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/dash
  install -Dm644 dash{,-functional}.{el,elc} "$pkgdir"/usr/share/emacs/site-lisp/dash
  gzip "$pkgdir"/usr/share/emacs/site-lisp/dash/*.el
}
