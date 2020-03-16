# Maintainer: dustball
# Contributor: Luke Arms <luke@arms.to>

pkgname=quicktile-git
pkgver=20200209
pkgrel=1
url="https://github.com/ssokolow/quicktile"
pkgdesc="Lightweight standalone alternative to Compiz Grid plugin"
arch=('any')
license=('GPLv2')
depends=('python2' 'pygtk' 'python2-xlib' 'python2-wnck' 'python2-setuptools')
optdepends=('python2-dbus')
makedepends=('git')

_gitroot='git://github.com/ssokolow/quicktile.git'
_gitname='quicktile'

build() {
  cd "$srcdir"

  msg "Cloning QuickTile from GIT"
  if [ -d "$_gitname" ]; then
    cd "$_gitname"
    git fetch &&
      git checkout legacy_gtk2 &&
      git pull || return 1
  else
    git clone -b legacy_gtk2 "$_gitroot" "$_gitname" || return 1
  fi
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
