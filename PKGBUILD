# Contributor: Cesar Romero <cesar.romero@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-psvn
pkgver=2015.07.20_21.42.00
pkgrel=1
pkgdesc="Subversion interface for emacs"
url="http://www.emacswiki.org/cgi-bin/wiki/SubVersion"
license=('GPL2')
depends=('emacs')
install=$pkgname.install
source=(http://www.xsteve.at/prg/emacs/psvn.el)
md5sums=('ec4b76a5f93ee23001fab5b9f6ae4c97')
makedepends=('awk')
arch=('any')

pkgver() {
  printf "%s_%s" $(awk '/The revision date of psvn/ {print $3}' psvn.el| head -1|tr - .|tr -d '"'|tr -d ',') $(awk '/The revision date of psvn/ {print $4}' psvn.el | head -1 | tr -d '"'|tr ':' '.')
}
  
build() {
  cd $srcdir
  emacs -batch -q -f batch-byte-compile psvn.el
}

package () {
  cd $srcdir
  install -Dm644 $srcdir/psvn.el \
    $pkgdir/usr/share/emacs/site-lisp/psvn.el 
  install -Dm644 $srcdir/psvn.elc \
    $pkgdir/usr/share/emacs/site-lisp/psvn.elc 
}
