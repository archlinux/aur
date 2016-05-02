# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=ginkgo-cadx
_pkgname=ginkgocadx
pkgver=3.8.2
pkgrel=2
pkgdesc='Advanced DICOM viewer and dicomizer'
arch=('i686' 'x86_64')
url='https://github.com/gerddie/ginkgocadx'
license=('LGPL3')
depends=('jsoncpp' 'wxgtk' 'dcmtk-snapshot' 'insight-toolkit' 'vtk6=6.3.0' 'openmpi')
makedepends=('git' 'cmake' 'tcp_wrappers-libs' 'glu' 'python2' 'qt5-webkit' 'webkitgtk2'
            'gdal' 'unixodbc' 'ffmpeg')
source=("https://github.com/gerddie/ginkgocadx/archive/3.8.2.tar.gz")
sha256sums=('3d428e54318bdd8f54982d150d7c108ce07f2a9f7f32c79f9b35015e3d362d82')

prepare() {

  # Make Ginkgo CADx accept VTK 6.*3*.0
  cd $_pkgname-$pkgver
  sed -i 's:FIND_PACKAGE(VTK 6.2.0 REQUIRED):FIND_PACKAGE(VTK 6.3.0 REQUIRED):' ./CMakeLists.txt

}

build() {
  mkdir -p build ; cd build

  cmake $srcdir/$_pkgname-$pkgver -DVTK_DIR=/opt/vtk6/lib/cmake/vtk-6.3 -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
