# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=emacs-nyan-mode
pkgver=20120517
pkgrel=1
pkgdesc="Nyan Cat in your Emacs modeline"
arch=('any')
url="http://github.com/TeMPOraL/nyan-mode/"
license=('GPL')
depends=('emacs')
makedepends=('git')
install=emacs-nyan-mode.install

_gitroot=git://github.com/TeMPOraL/nyan-mode.git
_gitname=nyan-mode

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_gitname"

  emacs -batch -f batch-byte-compile nyan-mode.el
}

package() {
  cd "$srcdir/$_gitname"
  install -d $pkgdir/usr/share/emacs/site-lisp
  cp -a $srcdir/$_gitname/*.el* $srcdir/$_gitname/img $pkgdir/usr/share/emacs/site-lisp
}

# vim:set ts=2 sw=2 et:
