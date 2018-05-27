# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=qtav-git
pkgver=v1.12.0.r123.g7793e949
pkgrel=1
pkgdesc="A cross-platform multimedia playback framework based on Qt and FFmpeg"
arch=('x86_64')
url="http://www.qtav.org/"
license=('LGPL')
conflicts=('qtav')
provides=('qtav')
depends=('qt5-declarative' 'ffmpeg' 'libxv' 'openal' 'uchardet' 'desktop-file-utils'
         'qt5-quickcontrols' 'qt5-svg')
source=("git+https://github.com/wang-bin/QtAV.git")
sha512sums=('SKIP')

pkgver(){
  cd "QtAV"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd $srcdir/QtAV

  qmake-qt5 "CONFIG+=no_rpath recheck"
  make
}

package() {
  cd $srcdir/QtAV

  make INSTALL_ROOT="${pkgdir}" install
}
