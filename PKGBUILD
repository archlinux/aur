# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=vanfanel-sdl-rbp-git
pkgver=12.5e5cf17
pkgrel=1
pkgdesc="Vanfanel's SDL 1.2.15 fork that includes a better RaspberryPi native 2D API driver for optimal performance and visuals"
arch=('armv7h')
url="https://github.com/vanfanel/SDL-1.2.15-raspberrypi"
license=('GPL')
depends=(raspberrypi-firmware-tools bash)
makedepends=()
provides=('sdl')
conflicts=('sdl')

source=("git+https://github.com/vanfanel/SDL-1.2.15-raspberrypi.git")
md5sums=('SKIP')

_gitname=SDL-1.2.15-raspberrypi

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  ./MAC_ConfigureSDL12-rpi2.sh
  make
}

package()
{
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}
