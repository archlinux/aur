# Maintainer: Panda <panda at rebornos dot org>

_pkgname=deepin-tweak
pkgname=deepin-tweak-git
pkgver=1.1.0.g4cb9c06
pkgrel=1
pkgdesc="A tool to optimize and tweak your Deepin system"
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-tweak"
license=('LGPL3')
provides=('deepin-tweak')
depends=('dtkdeclarative')
makedepends=('dtkgui' 'dtkcore' 'cmake' 'qt5-declarative' 'qt5-base' 'qt5-quickcontrols2')
source=(git+https://github.com/linuxdeepin/deepin-tweak)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git describe --tags | sed 's/-[0-9]*-g/-g/' | sed 's/-/./g')
}

build() {
  cd $srcdir/$_pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR=$pkgdir install
}