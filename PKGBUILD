# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=ginkgo-cadx
_pkgname=ginkgocadx
pkgver=3.8.4
pkgrel=1
pkgdesc='Advanced DICOM viewer and dicomizer'
arch=('i686' 'x86_64')
url='https://github.com/gerddie/ginkgocadx'
license=('LGPL3')
depends=('jsoncpp' 'wxgtk' 'dcmtk-snapshot' 'insight-toolkit' 'vtk6' 'openmpi')
makedepends=('git' 'cmake' 'libwrap' 'glu' 'python2' 'qt5-webkit' 'webkitgtk2'
            'gdal' 'unixodbc' 'ffmpeg')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gerddie/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('4e766c1882eb7cb8c64af1a9291959a11c4f1300b3bc9af0b1dda402d3e7d63d')

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
