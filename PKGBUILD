# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=udev-browse-git
pkgver=20100121
pkgrel=1
pkgdesc="Graphical browser for the Linux sysfs device tree"
arch=('i686' 'x86_64')
url="http://0pointer.de/blog/projects/udev-browse.html"
license=('LGPL')
depends=('udev' 'libgee' 'gtk2')
options=()
makedepends=('vala')
replaces=()
provides=('udev-browse')
conflicts=('udev-browse')
source=()

_gitroot="git://git.0pointer.de/udev-browse.git"
_gitname="udev-browse"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  install -d $pkgdir/usr/bin
  install -m 755 udev-browse $pkgdir/usr/bin
}
