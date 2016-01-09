# Maintainer: Nomorsad <nomorsad.poubelle@gmail.com>
pkgname=ltwheelconf-git
pkgver="0.2.7"
pkgrel=1
pkgdesc="Setup your Logitech wheel under Linux"
arch=('x86_64' 'i686')
url="https://github.com/thk/LTWheelConf"
license=('GPL')
depends=('libusb')
makedepends=('git' 'make')

_gitroot='https://github.com/thk/LTWheelConf.git'
_gitname='LTWheelConf'

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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

  cd "$srcdir/$_gitname/"

  make

}

package() {
  cd "$srcdir/$_gitname"
  install -D -m755 "ltwheelconf" "$pkgdir/usr/bin/ltwheelconf"
}

# vim:set ts=2 sw=2 et:

