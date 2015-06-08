# Contributor: Frikilinux <frikilinux@frikilinux.com.ar>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-identica-mode
_realname=identica-mode
pkgver=1.3.1
pkgrel=1
pkgdesc="GNU Emacs mode for laconi.ca microblogging service."
arch=('any')
url="http://git.savannah.gnu.org/cgit/${_realname}.git"
license=('GPL2' 'FDL1.2')
depends=('emacs' 'curl' 'wget')
makedepends=('texinfo')
install=${_realname}.install
source=("http://git.savannah.gnu.org/cgit/${_realname}.git/snapshot/${_realname}-$pkgver.tar.gz")
md5sums=('cffea13b5e777319c5867f7800bcb36a')

build() {
  cd $srcdir/${_realname}-$pkgver
  emacs -batch -q -f batch-byte-compile ${_realname}.el
  cd $srcdir/${_realname}-$pkgver/doc
  makeinfo ${_realname}.texi
}

package() {
  cd $srcdir/${_realname}-$pkgver
  install -d $pkgdir/usr/share/emacs/site-lisp/
  for _i in *.el *.elc
  do 
    install -m644 $srcdir/${_realname}-$pkgver/${_i} \
      $pkgdir/usr/share/emacs/site-lisp/${_i}
  done
  install -Dm644 $srcdir/${_realname}-$pkgver/doc/${_realname}.info \
    $pkgdir/usr/share/info/${_realname}.info
}
