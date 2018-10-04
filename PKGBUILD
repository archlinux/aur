# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-nim-mode
pkgver=0.4.1
pkgrel=1
pkgdesc="The long lost Emacs string manipulation library."
arch=('any')
url="https://github.com/nim-lang/nim-mode"
license=('GPL3')
depends=('emacs-dash' 'emacs-epc' 'emacs-ctable' 'emacs-epl' 'emacs-deferred' 'emacs-company-mode' 'emacs-commander' 'emacs-flycheck')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nim-lang/nim-mode/archive/v$pkgver.tar.gz" Makefile.patch)
sha256sums=('2fb54b05e144f72bc15b7f8bc1112535bf22f6a3b7bfbe6d8a5a2ab7206a5815'
            '20fef5db29d67788dd22cbc9dd97dd2a778a66a0b6f0b80aa9776d08cadb4576')

prepare() {
 cd ${pkgname#emacs-}-$pkgver
 patch -Np1 < "$srcdir"/Makefile.patch
}

build() {
  cd ${pkgname#emacs-}-$pkgver
  make 
}

package() {
  cd ${pkgname#emacs-}-$pkgver
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp/$pkgname
  cp *.el "$pkgdir"/usr/share/emacs/site-lisp/$pkgname
}
