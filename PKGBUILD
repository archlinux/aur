# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-idris-mode-git
pkgver=20150609
pkgrel=1
pkgdesc="Major mode for editing Idris."
arch=('any')
url="https://github.com/idris-hackers/idris-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-idris-mode')
replaces=('emacs-idris-mode')
install=$pkgname.install

_gitroot="https://github.com/idris-hackers/idris-mode"
_gitname="idris-mode"
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

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/idris-mode
  cp -R $srcdir/idris-mode/*.el $pkgdir/usr/share/emacs/site-lisp/idris-mode
}
