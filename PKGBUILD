# Maintainer: Lukas Sabota <lukas@lwsabota.com>
pkgbase=g13
pkgname=$pkgbase-git
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


pkgver() {
  cd $pkgbase
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $pkgbase ] ; then
    cd $pkgbase && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $pkgbase
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$pkgbase-build"
  git clone "$srcdir/$pkgbase" "$srcdir/$pkgbase-build"
  cd "$srcdir/$pkgbase-build"

  #
  # BUILD HERE
  #

  make
}

package() {
  cd "$srcdir/$pkgbase-build"
  mkdir -p ${pkgdir}/usr/bin
  cp g13d ${pkgdir}/usr/bin
} 

