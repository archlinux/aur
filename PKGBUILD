# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
epoch=1
pkgver=2018.01.15 # Taken from icicles.el
pkgrel=1
pkgdesc="an emacs library that enhances minibuffer completion"
arch=('any')
url="http://www.emacswiki.org/emacs/Icicles"
license=('GPL')
makedepends=(wget)
install=icicles.install

pkgver() {
  [ -d icicles ] && rm -r icicles
  mkdir icicles
  cd icicles
  wget http://www.emacswiki.org/emacs/download/icicles{,-chg,-cmd1,-cmd2,-doc1,-doc2,-face,-fn,-mac,-mcmd,-mode,-opt,-var}.el
  
  echo $(awk '/Version/ {print $3}' icicles.el) 
}

build() {
  cd icicles
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/icicles
  cp -r "$srcdir"/icicles/* "$pkgdir"/usr/share/emacs/site-lisp/icicles
}
