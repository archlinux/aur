pkgname=liblas
pkgver=1.8.0
pkgrel=1
pkgdesc="libLAS is a C/C++ library for reading and writing the very common LAS LiDAR format."
arch=('i686' 'x86_64')
url="http://www.liblas.org/"
license=('BSD')
source=(http://download.osgeo.org/liblas/libLAS-$pkgver.tar.bz2)
epends=('boost>=1.38.0' 'gdal>=1.7.0' 'libgeotiff>=1.3.0' 'laszip')
md5sums=('599881281d45db4ce9adb2d75458391e' )

build() {
  cd "$srcdir/libLAS-$pkgver"
  if [ -d makefiles ]; then
    rm -rf makefiles
  fi
  mkdir makefiles
  cd makefiles
  cmake ../ -G "Unix Makefiles"  \
  -DWITH_GDAL:BOOL=TRUE \
  -DWITH_GEOTIFF:BOOL=TRUE \
  -DWITH_LASZIP:BOOL=TRUE \
  -DWITH_UTILITIES:BOOL=TRUE \
  -DLASZIP_INCLUDE_DIR:PATH=/usr/include
  make
}

package() {
  cd "$srcdir/libLAS-$pkgver/makefiles"
  make DESTDIR="$pkgdir/" install
}


