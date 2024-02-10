# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=emacs-moonscript-mode
pkgver=r39.56f9047
pkgrel=1
pkgdesc="Emacs major mode for the MoonScript programming language"
arch=('any')
url="https://github.com/k2052/moonscript-mode"
license=('MIT')
depends=('emacs')
makedepends=('git')
install=$pkgname.install
source=('git+https://github.com/k2052/moonscript-mode.git')
md5sums=('SKIP')
_pkgname=${pkgname#emacs-}

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "moonscript.el")
			(byte-compile-file "moonscript-repl.el"))'
}

package() {
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  cd $srcdir/$_pkgname
  install -m644 *.el* $pkgdir/usr/share/emacs/site-lisp
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
