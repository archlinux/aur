# Maintainer: Samuel Mesa < samuelmesa@linuxmail.org >

pkgname=liblas-git
pkgver=0
pkgrel=1
pkgdesc='libLAS is a C/C++ library for reading and writing the very common LAS LiDAR format.'
url="http://www.liblas.org"
license=('BSD')
arch=('i686' 'x86_64')
depends=('boost>=1.38.0' 'gdal>=1.7.0' 'libgeotiff>=1.3.0' 'laszip')
makedepends=('git' 'cmake' 'gcc>=4.0')
conflicts=('liblas')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
source=("$pkgname"::'git://github.com/libLAS/libLAS.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"	
  if [ -d build ]; then
    rm -rf build
  fi
  mkdir build
  cd build

  cmake ../ -G "Unix Makefiles"  \
  -DWITH_GDAL:BOOL=TRUE \
  -DWITH_GEOTIFF:BOOL=TRUE \
  -DWITH_LASZIP:BOOL=TRUE \
  -DWITH_UTILITIES:BOOL=TRUE

  make
  
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="$pkgdir/" install
  
}
