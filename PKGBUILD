# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=emacs-julia-mode
pkgver=0.3.11
pkgrel=1
pkgdesc="Emacs major mode for the Julia programming language"
arch=('any')
url="http://www.julialang.org"
license=('GPL')
depends=('emacs')
install=$pkgname.install
source="https://raw.githubusercontent.com/JuliaLang/julia/v$pkgver/contrib/julia-mode.el"
md5sums=('fb222370cff7401b00a33104add98347')
_el="${pkgname#emacs-}.el"

build() {
  cd $srcdir
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "julia-mode.el"))'
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  install -m644 $srcdir/${_el} $pkgdir/usr/share/emacs/site-lisp
  install -m644 $srcdir/${_el}c $pkgdir/usr/share/emacs/site-lisp
}
