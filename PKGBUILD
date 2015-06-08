# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-rudel-bzr
pkgver=0.3r632
pkgrel=1
pkgdesc="A collaborative editing environment for GNU Emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/Rudel"
license=('GPL')
depends=('emacs')
makedepends=('bzr')
provides=('emacs-rudel')
conflicts=('emacs-rudel-git' 'emacs-rudel-svn')
install=$pkgname.install 
source=('emacs-rudel::bzr://rudel.bzr.sourceforge.net/bzrroot/rudel/trunk/')
md5sums=('SKIP')
_bzrmod="emacs-rudel"

pkgver() {
  cd "$srcdir"/$_bzrmod
  printf "%sr%s" 0.3 $(bzr revno)
}

build() {
  cd "$srcdir"/$_bzrmod
  emacs --script rudel-compile.el 
}

package() {
  install -d $pkgdir/usr/share/emacs/site-lisp/rudel
  cd "$srcdir/$_bzrmod"
  cp -a * $pkgdir/usr/share/emacs/site-lisp/rudel
}
