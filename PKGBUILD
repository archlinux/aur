# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-nim-mode-git
pkgver=0.4.1r68.ga508b4b
pkgrel=1
pkgdesc="Emacs mode for the nim programming language"
arch=('any')
url="https://github.com/nim-lang/nim-mode"
license=('GPL3')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('git')
depends=('emacs-dash' 'emacs-epc' 'emacs-ctable' 'emacs-epl' 'emacs-deferred' 'emacs-company-mode'
	 'emacs-commander' 'emacs-flycheck')
source=("git+https://github.com/nim-lang/nim-mode.git" Makefile.patch)
sha256sums=('SKIP' '20fef5db29d67788dd22cbc9dd97dd2a778a66a0b6f0b80aa9776d08cadb4576')

pkgver() {
  cd nim-mode
  git describe --tags --long | sed 's+-+r+' | tr - .|cut -c2-
}

prepare() {
  cd nim-mode
  patch -Np1 < "$srcdir"/Makefile.patch
}

build() {
  cd nim-mode
  make 
}

package() {
  cd nim-mode
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp/
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp/
}
