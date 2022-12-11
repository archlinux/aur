# Maintainer: Panda <panda at rebornos dot org>

_pkgname=deepin-log-viewer
pkgname=deepin-log-viewer-git
pkgver=5.9.13.g270b40c
pkgrel=1
pkgdesc="A tool to view system logs"
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-log-viewer"
license=('LGPL3')
provides=('deepin-log-viewer')
depends=('dtkdeclarative' 'polkit-qt5' 'dtkwidget')
makedepends=('dtkgui' 'dtkcore' 'qt5-quickcontrols2' 
             'qt5-declarative' 'qt5-base' 'cmake' 
             'rapidjson' 'xerces-c' 'gtest' 'boost'
             'qt5-svg' 'systemd-libs' 'icu' 'qt5-tools')
source=(git+https://github.com/linuxdeepin/deepin-log-viewer)
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
  mkdir $pkgdir/usr/share/polkit-1/actions/ -p || true
  cp $srcdir/$_pkgname/application/assets/com.deepin.pkexec.logViewerAuth.policy $pkgdir/usr/share/polkit-1/actions/
}
