# Maintainer: Markus Härer <markus.haerer@gmx.net>
# Based on plasma-volume-control-git from Antonio Rojas

_srcname=plasma-pa
pkgname=${_srcname}-git
pkgver=r322.d50ee61
pkgrel=2
pkgdesc='Volume applet for Plasma'
arch=('i686' 'x86_64')
url='https://invent.kde.org/plasma/plasma-pa'
license=('LGPL')
depends=('pulseaudio' 'plasma-workspace')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
provides=('plasma-volume-control' 'plasma-pa')
conflicts=('plasma-volume-control' 'plasma-volume-control-git' 'plasma-pa')
source=('git+https://invent.kde.org/plasma/plasma-pa.git')
md5sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p ${srcdir}/${_srcname}/build
}

build() {
  cd ${srcdir}/${_srcname}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${_srcname}/build
  make DESTDIR="${pkgdir}" install
}
