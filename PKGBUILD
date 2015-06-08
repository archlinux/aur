# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: egore911
# Contributor: Falcata
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=caelum
pkgver=0.6.1
pkgrel=3
pkgdesc="Library for OGRE targeted to help create nice-looking atmospheric effects."
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/Caelum"
depends=('ogre' 'cegui' 'doxygen' 'boost')
makedepends=('cmake')
provides=('caelum')
license=('LGPL')
source=(http://caelum.googlecode.com/files/caelum-${pkgver}.zip caelumplugin.patch libname.patch caelum-ogre-1.9.patch)
sha512sums=('e1f5a8d3992c7e45a5e70febdb962935c0fb31e8d84c4a6576f3aa757d15678ddca2f24fb9888a6806cbcfb4171a9c10e97714d7e7154a5fb98d5ac4078ddb98'
            'cc446e97eceef568e23ef15cbd32b183b5bb54e859ba558b1703c8c668fbc92f3bb904ffe95fa604d77937e653c96c2b80234d77dec5977fdc3656442a09f266'
            'c8e368ee203273e8cbfc7b8aa4b65e37e2a58275292bf061ccc15428f54f7da68e7de5d183626e008dd3a92fdd401ccb231d1c5ab98434878871b1ec453a2ba0'
            'SKIP')

build() {
  cd ${srcdir}/caelum-${pkgver}
  patch -p0 < ${srcdir}/caelumplugin.patch main/src/CaelumPlugin.cpp
  patch -p0 < ${srcdir}/libname.patch
  patch -p0 < ${srcdir}/caelum-ogre-1.9.patch

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/caelum-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
