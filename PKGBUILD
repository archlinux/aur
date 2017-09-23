# Contributor: Cesar Romero <cesar.romero@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-psvn
pkgver=2015.07.20_21.42.00
pkgrel=4
pkgdesc="Subversion interface for emacs"
url="http://www.emacswiki.org/cgi-bin/wiki/SubVersion"
license=('GPL2')
depends=('emacs')
install=$pkgname.install
source=(http://www.xsteve.at/prg/emacs/psvn.el)
md5sums=('1abc852ced8c82267770ea953d819486')
makedepends=('awk')
arch=('any')

pkgver() {
  printf "%s_%s" $(awk '/The revision date of psvn/ {print $3}' psvn.el| head -1|tr - .|tr -d '"'|tr -d ',') $(awk '/The revision date of psvn/ {print $4}' psvn.el | head -1 | tr -d '"'|tr ':' '.')
}

build() {
  emacs -batch -q -f batch-byte-compile ${pkgname#emacs-}.el
}

package () {
  cd $srcdir
  install -Dm644 $srcdir/psvn.el \
    $pkgdir/usr/share/emacs/site-lisp/psvn.el 
  install -Dm644 $srcdir/psvn.elc \
    $pkgdir/usr/share/emacs/site-lisp/psvn.elc 
}
