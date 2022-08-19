# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>

pkgname=pcraster
pkgver=4.3.3
pkgrel=1
pkgdesc='Environmental modelling software'
arch=('i686' 'x86_64')
url='https://pcraster.geo.uu.nl'
license=('GPL3')
depends=('python-pyqt5-chart' 'boost' 'python-numpy' 'xerces-c' 'gdal' 'ncurses')
makedepends=('cmake')
source=("https://github.com/pcraster/pcraster/archive/refs/tags/pcraster-$pkgver.tar.gz")
sha512sums=('d8a1d428827ccf75ec7f7bfa8e2a20289f65b59f6f50f672202c7ad6bf237f7fa0c4d0036b4e8db702aaf4c219e6e2eb283e37699a7489158834f4742be8180f')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  [[ -d build ]] || mkdir build

  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/build"

  cmake -G "Unix Makefiles" .. \
  -DCMAKE_BUILD_TYPE="Release" \
  -DPython3_EXECUTABLE:FILEPATH=/usr/bin/python3.10 \
  -DPython_ADDITIONAL_VERSIONS=3.10 \
  -DPCRASTER_PYTHON_INSTALL_DIR=/usr/lib/python3.10/site-packages \
  -DPCRASTER_WITH_PYTHON_MULTICORE:BOOL=TRUE \
  -DPCRASTER_BUILD_TEST:BOOL=TRUE \
  -DFERN_BUILD_ALGORITHM:BOOL=TRUE \
  -DPCRASTER_PACKAGE_BOOST:BOOL=ON \
  -DPCRASTER_PACKAGE_NCURSES:BOOL=ON \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr/
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

}
