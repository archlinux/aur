# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-ace-window-git
pkgver=r152.d93e16b
pkgrel=1
pkgdesc="Quickly switch windows in Emacs"
url="https://github.com/abo-abo/ace-window"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-avy')
makedepends=('git')
provides=('emacs-ace-window')
conflicts=('emacs-ace-window')
source=("git+https://github.com/abo-abo/ace-window.git")
sha256sums=('SKIP')
_gitname="ace-window"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  make clean test compile
}

package() {
  cd "$_gitname"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/ace-window"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/ace-window/"
}
