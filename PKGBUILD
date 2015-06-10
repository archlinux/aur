# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=load81-git
pkgver=20120321
pkgrel=1
pkgdesc="C64 like environment for Lua and SDL"
arch=('x86_64' 'i686')
url="https://github.com/antirez/load81"
license=('BSD')
depends=('lua' 'sdl' 'sdl_gfx')
install=load81.install
_gitroot="git://github.com/antirez/load81"
_gitname="load81"

build() {
  cd "$srcdir"

  msg "Connecting to the git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd "$_gitname-build"

  make
}

package() {
  cd "$_gitname-build"

  install -Dm755 load81 "$pkgdir/usr/bin/load81"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
