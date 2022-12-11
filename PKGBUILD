# Maintainer: Panda <panda at rebornos dot org>

_pkgname=dde-introduction
pkgname=deepin-introduction-git
pkgver=5.6.0.2.ge78967c
pkgrel=1
pkgdesc="Deepin Introduction"
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-introduction"
license=('LGPL3')
provides=('deepin-introduction' 'dde-introduction')
depends=('dtkdeclarative' 'libdrm' 'dbus' 'ffmpegthumbnailer' 'qt5-multimedia' 'gsettings-qt' 'deepin-movie')
makedepends=('dtkgui' 'dtkcore' 'qt5-tools' 'gtest')
source=(git+https://github.com/linuxdeepin/dde-introduction)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git describe --tags | sed 's/-[0-9]*-g/-g/' | sed 's/-/./g')
}

build() {
  cd $srcdir/$_pkgname
  mkdir build || true
  cd build
  cmake .. 
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR=$pkgdir install
}
