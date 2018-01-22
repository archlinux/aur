# Maintainer: Samuel Mesa <samuelmesa at linuxmail.org>

pkgname=tempus
_pkgname=Tempus
pkgver=2.2.0  
pkgrel=1
pkgdesc="Tempus is a C++ framework which offers generic graph manipulation abilities in order to develop multimodal path planning requests. It features."
arch=(i686 x86_64)
url="http://ifsttar.github.io/Tempus/"
license=('GNU LGPLv2+')
depends=('gdal' 'boost' 'postgresql' 'openmp' 'fcgi' 'libxml2' 'python2-pyqt4')
makedepends=('cmake')
optdepends=('qgis')
provides=()
conflicts=()
replaces=()
options=('!makeflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ifsttar/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('7a4d94c562d4487f415ca054aafb10b5')

prepare() {
  cd $_pkgname-$pkgver

  [[ -d build ]] || mkdir build
}

build() {   
  cd $_pkgname-$pkgver/build
  
  cmake -G "Unix Makefiles" ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_CORE=TRUE \
    -DBUILD_DOC=TRUE \
    -DBUILD_OSM2TEMPUS=TRUE \
    -DBUILD_QGIS_PLUGIN=TRUE \
    -DBUILD_TOOLS=TRUE \
    -DBUILD_WPS=TRUE \
    -DPYUIC4_PROGRAM=/usr/bin/python2-pyuic4

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/build

  make DESTDIR="$pkgdir" install
  echo "For install QGIS Plugin execute the script /usr/share/tempus/install-qgis-plugins.sh"
}  




