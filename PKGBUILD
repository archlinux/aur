# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-emmet-mode-git
pkgver=20150609
pkgrel=1
pkgdesc="Minor mode providing support for Zen Coding, with Emmet's feature expansion."
arch=('any')
url="https://github.com/smihica/emmet-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-emmet-mode')
replaces=('emacs-emmet-mode')
install=$pkgname.install

_gitroot="https://github.com/smihica/emmet-mode"
_gitname="emmet-mode"
build() {
  cd $startdir/src
  msg "Connecting to github.com GIT server...."

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
  make all

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/emmet-mode
  install -Dm644 emmet-mode.el emmet-mode.elc $pkgdir/usr/share/emacs/site-lisp/emmet-mode
}
