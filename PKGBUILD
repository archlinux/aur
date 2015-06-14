# Maintainer: Bhushan Shah <bhush94 at gmail dot com>
pkgname=plasma-mediacenter-git
pkgver=5.3.0.r21.gce76a79
pkgrel=1
pkgdesc="A mediacenter user interface based on KDE Plasma components"
arch=('i686' 'x86_64')
url="http://community.kde.org/Plasma/Plasma_Media_Center/"
license=('GPL3')
depends=('plasma-workspace-git' 'baloo')
makedepends=('git' 'cmake' 'baloo')
conflicts=('plasma-mediacenter')
provides=('plasma-mediacenter')
source=('git://anongit.kde.org/plasma-mediacenter.git')
md5sums=('SKIP')

_gitname="plasma-mediacenter"

pkgver() {
  cd $_gitname
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-mediacenter \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Debug
  make
  cd ../plasma-mediacenter
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
