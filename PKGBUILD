# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>

pkgname=pcraster
pkgver=4.3.2
pkgrel=2
pkgdesc='Environmental modelling software'
arch=('i686' 'x86_64')
url='https://pcraster.edu/'
license=('GPL3')
depends=('python-pyqt5-chart' 'boost' 'python-numpy' 'xerces-c' 'gdal' 'ncurses')
makedepends=('cmake')
source=("https://github.com/pcraster/pcraster/archive/refs/tags/pcraster-$pkgver.tar.gz")
sha512sums=('78e6b9d2970a9b9d55dba3312e4bd613d3fab714db67139dcc6ae102e62a220543d8e6d15afd343c76d1c02187e6c3626419d9997add65aaf1f66ad1b0738475')

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
