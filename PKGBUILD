# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=jm2cv-git
pkgver=20130518
pkgrel=1
pkgdesc="converts between JACK MIDI and CV control voltage"
arch=('i686' 'x86_64')
url="http://git.fuzzle.org/cgit/jm2cv.git/"
license=('GPL')
depends=('jack')
provides=('jm2cv')
conflicts=('jm2cv')

_gitroot="http://git.fuzzle.org/cgit/jm2cv.git"
_gitname="jm2cv"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" .
  make
}

package() {
  cd "$srcdir/$_gitname-build" 
  make install
}

# vim:set ts=2 sw=2 et:
