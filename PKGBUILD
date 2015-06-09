# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-less-css-mode-git
pkgver=20150609
pkgrel=1
pkgdesc="Major mode for LESS CSS (lesscss.org), with support for compile-on-save."
arch=('any')
url="https://github.com/purcell/less-css-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-less-css-mode')
replaces=('emacs-less-css-mode')
install=$pkgname.install

_gitroot="https://github.com/purcell/less-css-mode"
_gitname="less-css-mode"
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

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/less-css-mode
  install -Dm644 less-css-mode.el $pkgdir/usr/share/emacs/site-lisp/less-css-mode
}
