# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

pkgname=osgearth
pkgver=3.1
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('i686' 'x86_64')
url='https://osgearth.org'
license=('LGPL')
depends=('openscenegraph' 'gdal' 'minizip' 'qt5-base' 'rocksdb' 'duktape')
makedepends=('cmake')
provides=('osgearth')
source=("https://github.com/gwaldron/osgearth/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('20230b8e07da210c1a7757247a339243')


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
  -DOSGEARTH_INSTALL_SHADERS=ON \
  -DWITH_EXTERNAL_DUKTAPE=ON \
  ..

  make
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
