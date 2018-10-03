# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-git-timemachine
pkgver=4.5
pkgrel=1
pkgdesc="Step through historic versions of git controlled file using everyone's favourite editor"
arch=(any)
url="https://gitlab.com/pidu/git-timemachine.git"
license=('GPL3')
depends=('emacs')
source=("https://gitlab.com/pidu/git-timemachine/-/archive/$pkgver/git-timemachine-$pkgver.tar.gz")
sha256sums=('fe1713b455a4936a2cd39dbda39d26eb6386676778671ff4795a311b19062446')

build() {
  cd ${pkgname#emacs-}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${pkgname#emacs-}-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
