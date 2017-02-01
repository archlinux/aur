# Maintainer: ebiadsu
# Previous Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=emacs-dash
pkgver=2.13.0
pkgrel=1
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/dash.el/archive/$pkgver.tar.gz")
md5sums=('f246c9665345a6870820f8f9567c7c18')

build() {
  cd dash.el-"$pkgver"
  emacs -Q -batch -L . -f batch-byte-compile dash{,-functional}.el
}

package() {
  cd dash.el-"$pkgver"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/dash
  install -Dm644 dash{,-functional}.{el,elc} \
	  "$pkgdir"/usr/share/emacs/site-lisp/dash
  gzip "$pkgdir"/usr/share/emacs/site-lisp/dash/*.el
  install -Dm644 dash.info "$pkgdir"/usr/share/info/dash.info
  gzip "$pkgdir"/usr/share/info/dash.info
}

