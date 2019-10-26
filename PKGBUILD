# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=scantools
pkgver=0.6.4
pkgrel=3
pkgdesc="scantools is a library and a matching set of command line applications for graphics manipulation, written with a view towards the handling of scanned documents and generation of high-quality PDF files."
arch=('x86_64')
url="https://cplx.vm.uni-freiburg.de/scantools/"
license=('GPL')
depends=('qpdf' 'qt5-imageformats' 'gcc' 'graphviz' 'jbig2dec' 'libjpeg-turbo' 'libtiff' 'openjpeg2' 'tesseract' 'qpdf' 'qt5-base' 'zlib')
makedepends=('cmake' 'doxygen' 'git')
source=("https://gitlab.com/kebekus/scantools/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('154b9c4da5f4d08bdaac5bf740f07fcb20e19028fd0c429d85636cbba7ed4071')

build() {
  cd ${pkgname}-${pkgver}
  echo "WARN_AS_ERROR = NO" >> src/libscantools/Doxyfile.in  # Workaround for Doxygen error
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib ../src
  make -j $(nproc)
}

package() {
	cd ${pkgname}-${pkgver}/build
	make DESTDIR="${pkgdir}/" install
}
