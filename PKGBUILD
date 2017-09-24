# Contributor: TrekDev <trekdev0 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-solidity-mode-git
pkgver=0.1.1r41.e4aa019
pkgrel=1
pkgdesc='Solidity mode package for Emacs'
url='https://github.com/ethereum/emacs-solidity'
arch=('any')
license=('MIT')
source=("${pkgname}::git+https://github.com/ethereum/emacs-solidity")
sha256sums=('SKIP')
depends=('emacs')

pkgver() {
  cd ${pkgname}
  printf "%sr%s.%s" "$(awk '/;; Version:/ {print $3}' solidity-mode.el)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  emacs -batch -f batch-byte-compile solidity-mode.el
}

package() {
  cd ${pkgname}
  install -dm0755 $pkgdir/usr/share/emacs/site-lisp/solidity-mode
  install -dm0755 $pkgdir/usr/share/doc/emacs-solidity-mode
  install -m0644 *.el{,c} -t $pkgdir/usr/share/emacs/site-lisp/solidity-mode
  install -m0644 README.org $pkgdir/usr/share/doc/emacs-solidity-mode/README
}
