# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=emacs-julia-mode
pkgver=0.3.11
pkgrel=2
pkgdesc="Emacs major mode for the Julia programming language"
arch=('any')
url="http://www.julialang.org"
license=('GPL')
depends=('emacs')
install=$pkgname.install
source=("$pkgname-$pkgver.el::https://raw.githubusercontent.com/JuliaLang/julia/v$pkgver/contrib/julia-mode.el")
sha256sums=('392dd3d6c4fc9a788fe86b445e6661983b3c46e44e30ac2e0ff54e9b2928d5d8')

build() {
  cp $pkgname-$pkgver.el julia-mode.el
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "julia-mode.el"))'
}

package() {
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 ${pkgname#emacs-}.el "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 ${pkgname#emacs-}.elc "$pkgdir"/usr/share/emacs/site-lisp
}
