# Maintainer: Jon Eyolfson <jon@eyl.io>
pkgname=emacs-rust-mode
pkgver=r205
pkgrel=1
pkgdesc="A major Emacs mode for editing Rust source code"
arch=('any')
url="https://github.com/rust-lang/rust-mode"
depends=('emacs')
license=('MIT')
source=("$pkgname"::'git://github.com/rust-lang/rust-mode.git')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  emacs -batch -f batch-byte-compile rust-mode.el
}

package() {
  install -d $pkgdir/usr/share/emacs/site-lisp
  cd "$srcdir/$pkgname"
  cp rust-mode.{el,elc} $pkgdir/usr/share/emacs/site-lisp
}
