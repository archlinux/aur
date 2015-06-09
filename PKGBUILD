# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-processing-mode-git
pkgver=20150609
pkgrel=1
pkgdesc="Major mode for Processing 2.0."
arch=('any')
url="https://github.com/ptrv/processing2-emacs"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-processing-mode')
replaces=('emacs-processing-mode')
install=$pkgname.install
source=()
md5sums=()

_gitroot="git://github.com/ptrv/processing2-emacs.git"
_gitname="processing2-emacs"

build() {
  cd $startdir/src
  msg "Connecting to GIT server..."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd $startdir/src/$_gitname

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/processing-mode
  emacs -batch -f batch-byte-compile processing-mode.el
  install -Dm644 processing-mode.el processing-mode.elc $pkgdir/usr/share/emacs/site-lisp/processing-mode
}
