# Maintainer: George Eleftheriou

pkgname=hdf-java
pkgver=3.3.2
pkgrel=1
pkgdesc="The hdf5 java native interfaces (JNI)"
arch=('i686' 'x86_64')
url="https://support.hdfgroup.org/products/java/"
license=('custom')
makedepends=('cmake' 'apache-ant')
depends=('java-environment')
source=("http://www.hdfgroup.org/ftp/HDF5/releases/HDF-JAVA/hdfjni-${pkgver}/src/CMake-${pkgname/-/}-${pkgver}.tar.gz")
md5sums=('9fdbb55f2292092f0e6b46078109d54a')

prepare() {
  cd "CMake-${pkgname/-/}-${pkgver}"
  sed -i "s;DCMAKE_INSTALL_PREFIX:PATH=\${INSTALLDIR};DCMAKE_INSTALL_PREFIX:PATH=/opt/${pkgname/-/}-${pkgver};" HDFJavaconfig.cmake
}

build() {
  cd "CMake-${pkgname/-/}-${pkgver}"
  ./build-hdfjava-unix.sh
}

package() {
  cd "CMake-${pkgname/-/}-${pkgver}/build"
  make -j1 DESTDIR=${pkgdir} install
}
