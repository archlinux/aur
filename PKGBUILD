# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=pcraster
pkgver=4.4.1
pkgrel=1
pkgdesc='Environmental modelling software'
arch=('i686' 'x86_64')
url='https://pcraster.geo.uu.nl'
license=('GPL3')
depends=('python-pyqt5-chart' 'boost' 'python-numpy' 'xerces-c' 'gdal' 'ncurses')
makedepends=('cmake')
source=("https://github.com/pcraster/pcraster/archive/refs/tags/pcraster-$pkgver.tar.gz")
sha512sums=('3e4bd50476166320c0add15b2e972242fe07fc5750fa7ed550b46bd12751258deede30eb2b6c0d139aba9ae3468971f846416eafbea74866113ef23b084105fd')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  [[ -d build ]] || mkdir build

  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/build"

  cmake -G "Unix Makefiles" .. \
  -DCMAKE_BUILD_TYPE="Release" \
  -DPython3_EXECUTABLE:FILEPATH=/usr/bin/python3.11 \
  -DPython_ADDITIONAL_VERSIONS=3.11 \
  -DPCRASTER_PYTHON_INSTALL_DIR=/usr/lib/python3.11/site-packages \
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
