# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sunrise-commander
pkgver=6r464
pkgrel=1
pkgdesc="A two panel filemanager for emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/Sunrise_Commander"
license=('GPL')
depends=('emacs' 'avfs')
makedepends=('git')
optdepends=('zip: support for zip files' 'unzip: support for zip files')
source=(git+https://github.com/escherdragon/sunrise-commander.git#commit=cf8305a149a321d028858057e7a7c92f0038a06a)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(printf 6r%s $(awk '/RCS/ {print $5}' $pkgname.el))
}

build() {
  cd $pkgname
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd $pkgname
  install -Dm644 $pkgname.el{,c} -t "$pkgdir"/usr/share/emacs/site-lisp/
}
