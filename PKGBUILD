# Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=emacs-dash
pkgver=2.11.0
pkgrel=1
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
install=emacs-dash.install
source=("https://github.com/magnars/dash.el/archive/$pkgver.tar.gz")
sha256sums=('d888d34b9b86337c5740250f202e7f2efc3bf059b08a817a978bf54923673cde')

build() {
  cd dash.el-"$pkgver"
  emacs -batch -L . -f batch-byte-compile dash{,-functional}.el
  sh create-docs.sh
}

package() {
  cd dash.el-"$pkgver"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/dash
  install -Dm644 dash{,-functional}.{el,elc} "$pkgdir"/usr/share/emacs/site-lisp/dash
  gzip "$pkgdir"/usr/share/emacs/site-lisp/dash/*.el
  install -Dm644 dash.info "$pkgdir"/usr/share/info/dash.info
  gzip "$pkgdir"/usr/share/info/dash.info
}
