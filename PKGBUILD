# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

pkgname=osgearth
pkgver=2.8
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('i686' 'x86_64')
url='http://www.osgearth.org'
license=('LGPL')
depends=('openscenegraph' 'gdal' 'minizip' 'qt5-base')
makedepends=('cmake')
provides=('osgearth')
conflicts=('osgearth-qt5')
source=("https://github.com/gwaldron/osgearth/archive/${pkgname}-${pkgver}.tar.gz" "fix-suppor_geos36.patch")
md5sums=('b3dbb1e386db52587af17c3d9999d3e6'
         '3d975f10662544231cf36371f8549c6a')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}

  patch -Np1 -i ${srcdir}/fix-suppor_geos36.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}

  ##Build
  #if [[ -d "build" ]]; then
  #  (rm -rf build)
  #fi

  #mkdir build
  #cd build

  #cmake \
  #-DLIB_POSTFIX= \
  #-DCMAKE_INSTALL_PREFIX=/usr \
  #-DOSGEARTH_USE_QT=/usr \
  #..

  #make -j3
}

package() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}/build
  make DESTDIR=$pkgdir install
  
  install -d ${pkgdir}/usr/share/osgearth
  install -d ${pkgdir}/usr/share/osgearth/test
  install -d ${pkgdir}/usr/share/osgearth/data
  cp -rfv ${srcdir}/${pkgname}-${pkgname}-${pkgver}/tests/* ${pkgdir}/usr/share/osgearth/test
  cp -rfv ${srcdir}/${pkgname}-${pkgname}-${pkgver}/data/* ${pkgdir}/usr/share/osgearth/data
}
