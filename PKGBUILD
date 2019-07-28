# Maintainer: Stefan Husmann <stefan-husmann@t-online.de

pkgname=emacs-bui
pkgver=1.2.1
pkgrel=1
pkgdesc="Buffer interface library for Emacs"
arch=('any')
url="https://github.com/alezost/bui.el"
license=('GPL')
depends=('emacs')
makedepends=('git' 'emacs-dash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('daac3bfafdcca81c6f13c501fda275f1')

build() {
  cd ${pkgname#emacs-}.el-$pkgver
  emacs -Q -batch -L . -L /usr/share/emacs/site-lisp -f batch-byte-compile *.el || true
}

package() {
  _pkg_emacs="$pkgdir/usr/share/emacs/site-lisp/"

  cd ${pkgname#emacs-}.el-$pkgver
  install -d $_pkg_emacs
  cp *.el{,c} $_pkg_emacs
}
