# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-babel-git
pkgver=v1.1.20.gc539c06
pkgrel=1
pkgdesc="Emacs interface to web translation services such as Babelfish"
arch=('any')
url="https://github.com/juergenhoetzel/babel"
license=('GPL')
depends=('emacs')
makedepends=('git')
provides=('emacs-babel')
conflicts=('emacs-babel')
install=emacs-babel.install
source=(git://github.com/juergenhoetzel/babel.git)
md5sums=('SKIP')
_gitname="babel"

pkgver() {
  cd $_gitname
  # Git tag
 git describe --always|sed 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  emacs -Q -batch -L . -f batch-byte-compile $_gitname.el
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 $_gitname.el $pkgdir/usr/share/emacs/site-lisp/$_gitname.el
  install -Dm644 $_gitname.elc $pkgdir/usr/share/emacs/site-lisp/$_gitname.elc
}
