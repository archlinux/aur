# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=ginkgo-cadx
pkgname=$_pkgname-git
pkgver=3.8.0.11.ga8819b7
pkgrel=2
pkgdesc='Advanced DICOM viewer and dicomizer'
arch=('i686' 'x86_64')
url='https://github.com/gerddie/ginkgocadx'
license=('LGPL3')
depends=('jsoncpp' 'wxgtk' 'dcmtk-git' 'itk-git' 'vtk6=6.3.0' 'openmpi')
makedepends=('git' 'cmake' 'libwrap' 'glu' 'python2'
             'qt5-webkit' 'webkitgtk2' 'gdal' 'unixodbc' 'ffmpeg')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-2} "ginkgocadx-bin")
source=("$_pkgname::git+https://github.com/gerddie/ginkgocadx.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:-:.:g'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname -DVTK_DIR=/opt/vtk6/lib/cmake/vtk-6.3 -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
