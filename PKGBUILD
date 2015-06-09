# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-arduino-mode-git
pkgver=20150609
pkgrel=1
pkgdesc="Major mode for the Arduino language."
arch=('any')
url="https://github.com/bookest/arduino-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-arduino-mode')
replaces=('emacs-arduino-mode')
install=$pkgname.install

_gitroot="https://github.com/bookest/arduino-mode"
_gitname="arduino-mode"
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

  install -d $pkgdir/usr/share/emacs/site-lisp/
  install -Dm644 arduino-mode.el $pkgdir/usr/share/emacs/site-lisp/
}
