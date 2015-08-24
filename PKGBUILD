# Maintainer: Markus Härer <markus.haerer@gmx.net>
# Based on plasma-volume-control-git from Antonio Rojas

_srcname=plasma-pa
pkgname=${_srcname}-git
pkgver=r261.7362c57
pkgrel=1
pkgdesc='Volume applet for Plasma'
arch=('i686' 'x86_64')
url='http://quickgit.kde.org/?p=plasma-pa.git'
license=('LGPL')
depends=('pulseaudio' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
provides=('plasma-volume-control' 'plasma-pa')
conflicts=('plasma-volume-control' 'plasma-volume-control-git' 'plasma-pa')
source=('git://anongit.kde.org/plasma-pa.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_srcname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
