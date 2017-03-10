# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=ginkgo-cadx
_pkgname=ginkgocadx
pkgver=3.8.5
pkgrel=1
pkgdesc='Advanced DICOM viewer and dicomizer'
arch=('i686' 'x86_64')
url='https://github.com/gerddie/ginkgocadx'
license=('LGPL3')
depends=('jsoncpp' 'wxgtk' 'dcmtk-snapshot' 'insight-toolkit' 'vtk6' 'openmpi')
makedepends=('git' 'cmake' 'libwrap' 'glu' 'python2' 'qt5-webkit' 'webkitgtk2'
            'gdal' 'unixodbc' 'ffmpeg')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gerddie/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('c234f3f035d4ed1ed68718ed43a7e6168513758f0f434361e51aab65cea8290a')

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname-$pkgver -DVTK_DIR=/opt/vtk6/lib/cmake/vtk-6.3 -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
