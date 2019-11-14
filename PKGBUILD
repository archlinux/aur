# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-commander-git
pkgver=0.7.0r10.gc93985d
pkgrel=2
pkgdesc="Command line parsing for emacs"
arch=('any')
url="https://github.com/rejeep/commander.el.git"
conflicts=('emacs-commander')
provides=('emacs-commander')
license=('GPL3')
depends=('emacs-f')
makedepends=('git')
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd commander.el
  git describe --tags|sed 's+-+r+'|tr - .|cut -c2-
}

build() {
  cd commander.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd commander.el
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
