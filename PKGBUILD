# Contributor: mutantmonkey <mutantmonkey@gmail.com>
pkgname=dex-git
pkgver=20111116
pkgrel=1
pkgdesc="A program to execute DesktopEntry files of type Application, primarily for window managers that do not implement the Freedesktop autostart specification"
url="https://github.com/jceb/dex"
arch=('any')
license=('GPL2')
depends=('python2')
makedepends=('git')
provides=('dex')
conflicts=('dex')
source=()
md5sums=()
sha256sums=()

_gitroot="https://github.com/jceb/dex.git"
_gitname="dex"

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

  sed -i 's/\/usr\/bin\/python/\/usr\/bin\/python2/' dex || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  install -m755 -D dex $pkgdir/usr/bin/dex
}

# vim:set ts=2 sw=2 et:
