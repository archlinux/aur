# Maintainer: hamki <hamki.do2000@gmail.com>

pkgname=emacs-exwm
pkgver=0.23
pkgrel=1
pkgdesc="Use emacs as windowmanager"
arch=('any')
url="https://github.com/ch11ng/exwm.git"
license=('GPL')
depends=('emacs-xelb')
makedepends=()
provides=()
conflicts=()
source=("https://github.com/ch11ng/exwm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ac055844bf7a91dab3a8a84f0089d16102424f5cd57c39eb1231bca2fd57a15')
_gitname="exwm"


build() {
  cd "$_gitname-$pkgver"
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  cd "$_gitname-$pkgver"
  for _i in *.el
  do
    install -Dm644 ${_i} "$pkgdir"/usr/share/emacs/site-lisp/exwm/${_i}
  done
  install -Dm644 README.md "$pkgdir"/usr/share/doc/emacs-exwm/README.md
  install -Dm644 xinitrc "$pkgdir"/usr/share/doc/emacs-exwm/sample-xinitrc
}
