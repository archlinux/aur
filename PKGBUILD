# Maintainer: Matthias Kühlke <mad@unserver.de>
pkgname=xmenud-git
pkgver=20150616
pkgrel=1
pkgdesc="A small start menu application"
arch=('any')
url="http://mad.unserver.de/2010/xmonad/xmenud/"
license=('GPL')
groups=()
depends=('pygtk' 'python2-xdg' 'gnome-menus' 'python2')
makedepends=('git')
provides=()
conflicts=(xmenud)
replaces=(xmenud)
backup=()
options=()
install=
source=()

noextract=()
#generate with 'makepkg -g'

_gitroot="https://github.com/themad/xmenud.git"
_gitname="xmenud"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" xmenud.py
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/bin/" || return 1
  cp xmenud.py "$pkgdir/usr/bin/xmenud" || return 1
}

# vim:set ts=2 sw=2 et:
