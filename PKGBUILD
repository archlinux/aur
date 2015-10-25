# Maintainer: ebiadsu
# Previous Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=emacs-dash
pkgver=2.12.1
pkgrel=1
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
install=emacs-dash.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/dash.el/archive/$pkgver.tar.gz")
sha256sums=('41460193aa74787b247b09ad7cae696016110abba2a922ef1a067472eba15220')

build() {
  cd dash.el-"$pkgver"
  emacs -batch -L . -f batch-byte-compile dash{,-functional}.el
  sh create-docs.sh
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
