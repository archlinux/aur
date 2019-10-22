# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-nim-mode-git
pkgver=0.4.1.r89.g3fb6643
pkgrel=1
pkgdesc="Emacs mode for the nim programming language - from git"
arch=('any')
url="https://github.com/nim-lang/nim-mode"
license=('GPL3')
depends=('emacs-dash' 'emacs-epc' 'emacs-ctable' 'emacs-epl' 'emacs-deferred' 'emacs-company-mode' 'emacs-commander' 'emacs-flycheck')
makedepends=('git' 'cask')
conflicts=('emacs-nim-mode')
provides=('emacs-nim-mode')
source=("$pkgname::git+$url" Makefile.patch)
sha256sums=('SKIP'
            '20fef5db29d67788dd22cbc9dd97dd2a778a66a0b6f0b80aa9776d08cadb4576')

pkgver() {
  cd ${pkgname}
  git describe --tags --long | sed 's+-+.r+'|tr - .|cut -c2-
}

prepare() {
  cd ${pkgname}
  patch -Np1 < "$srcdir"/Makefile.patch
}

build() {
  cd ${pkgname}
  cask build 
}

package() {
  cd ${pkgname}
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp
}
