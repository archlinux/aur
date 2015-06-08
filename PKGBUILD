# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=qimageblitz-svn
pkgname=('qimageblitz-qt4-svn' 'qimageblitz-qt5-svn')
pkgver=1427967
pkgrel=1
pkgdesc="An interm image effect library (SVN version)"
arch=('x86_64')
url="http://www.kde-org"
license=('GPL-2' 'LGPL-2')
makedepends=('qt4' 'qt5-base' 'cmake' 'subversion')
conflicts=('qimageblitz')
provides=('qimageblitz')
source=("svn://anonsvn.kde.org/home/kde/trunk/kdesupport/qimageblitz")
sha1sums=('SKIP')

pkgver() {
  cd qimageblitz
  echo "$(svnversion)"
}

prepare() {
  mkdir -p build-qt{4,5}
}

build() {
  cd ${srcdir}/build-qt4
  cmake ../qimageblitz \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT4_BUILD=ON
  make
  cd "${srcdir}/build-qt5"
  cmake ../qimageblitz \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT4_BUILD=OFF
  make
}

package_qimageblitz-qt4-svn() {
  pkgdesc="An interm image effect library. Qt4 version. (SVN version)"
  depends=('qt4')
  conflicts=('qimageblitz' 'qimageblitz-qt5')
  provides=('qimageblitz' 'qimageblitz-qt4' )

  make -C build-qt4 DESTDIR="${pkgdir}" install
}

package_qimageblitz-qt5-svn() {
  pkgdesc="An interm image effect library. Qt5 version. (SVN version)"
  depends=('qt5-base')
  conflicts=('qimageblitz' 'qimageblitz-qt4')
  provides=('qimageblitz' 'qimageblitz-qt5' )

  make -C build-qt5 DESTDIR="${pkgdir}" install
}
