# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

pkgname=osgearth
pkgver=2.7
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('i686' 'x86_64')
url=('http://www.osgearth.org')
license=('LGPL')
depends=('openscenegraph' 'gdal' 'minizip' 'qt5-base')
makedepends=('cmake')
provides=('osgearth')
conflicts=('osgearth-qt5')
source=("https://github.com/gwaldron/osgearth/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('aad15a3ee27a34dcabc9b8f4922a1e96')

build() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}

  #Build
  if [[ -d "build" ]]; then
    (rm -rf build)
  fi

  mkdir build
  cd build

  cmake \
  -DLIB_POSTFIX= \
  -DCMAKE_INSTALL_PREFIX=/usr \
  ..

  make -j5
}

package() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}/build
  make DESTDIR=$pkgdir install
  
  install -d ${pkgdir}/usr/share/osgearth
  install -d ${pkgdir}/usr/share/osgearth/test
  install -d ${pkgdir}/usr/share/osgearth/data
  install -Dm644 ${srcdir}/${pkgname}-${pkgname}-${pkgver}/tests/* ${pkgdir}/usr/share/osgearth/test
  cp -rfv ${srcdir}/${pkgname}-${pkgname}-${pkgver}/data/* ${pkgdir}/usr/share/osgearth/data
}
