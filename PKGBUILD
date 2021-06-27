# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
pkgname=emacs-processing-mode-git
pkgver=20171023
pkgrel=1
pkgdesc="Major mode for Processing 2.0."
arch=('any')
url="https://github.com/ptrv/processing2-emacs"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-processing-mode')
conflicts=('emacs-processing-mode')
install=$pkgname.install
source=(git+https://github.com/ptrv/processing2-emacs.git)
md5sums=(SKIP)
_gitname="processing2-emacs"

pkgver() {
  cd $_gitname
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd $_gitname
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/processing-mode
  emacs -batch -f batch-byte-compile processing-mode.el
  install -Dm644 processing-mode.el processing-mode.elc $pkgdir/usr/share/emacs/site-lisp/processing-mode
}
