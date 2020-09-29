# Maintainer: Markus Härer <markus.haerer@gmx.net>
# Based on plasma-volume-control-git from Antonio Rojas

_srcname=plasma-pa
pkgname=${_srcname}-git
pkgver=v5.19.90.r1.g62d3c9e
pkgrel=1
pkgdesc='Volume applet for Plasma'
arch=('i686' 'x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=(plasma-workspace libcanberra-pulse pulseaudio perl)
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
provides=('plasma-volume-control' 'plasma-pa')
conflicts=('plasma-volume-control' 'plasma-volume-control-git' 'plasma-pa')
source=('git+https://invent.kde.org/plasma/plasma-pa.git')
md5sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_srcname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
