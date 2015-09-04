# Maintainer: Lukas Sabota <lukas@lwsabota.com>
pkgname=g13-git
pkgver=20150903
pkgrel=2
pkgdesc="Userspace driver for the Logitech G13 Keyboard"
arch=('x86_64' 'i686')
url="https://github.com/ecraven/g13"
license=('unknown')
groups=()
depends=('boost-libs')
makedepends=('git' 'boost')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitroot="https://github.com/ecraven/g13"
_gitname="g13"


pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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

  #
  # BUILD HERE
  #

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p ${pkgdir}/usr/bin
  cp g13d ${pkgdir}/usr/bin
} 

