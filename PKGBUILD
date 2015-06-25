# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=asciiportal-git
pkgver=20110531
pkgrel=1
pkgdesc="Text based puzzle game inspired by the popular video game."
arch=('i686' 'x86_64')
url="http://cymonsgames.com/asciiportal/"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'pdcurses' 'yaml-cpp')
makedepends=('git')
provides=('asciiportal')
conflicts=('asciiportal' 'asciiportal-mod')

_gitroot="git://github.com/cymonsgames/ASCIIpOrtal.git"
_gitname="ASCIIpOrtal"

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

  make linux
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
