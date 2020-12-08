# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=scantools
pkgver=1.0.2
pkgrel=1
pkgdesc="scantools is a library and a matching set of command line applications for graphics manipulation, written with a view towards the handling of scanned documents and generation of high-quality PDF files."
arch=('x86_64')
url="https://cplx.vm.uni-freiburg.de/scantools/"
license=('GPL')
depends=('qpdf' 'qt5-imageformats' 'gcc' 'graphviz' 'jbig2dec' 'libjpeg-turbo' 'libtiff' 'openjpeg2' 'tesseract' 'qpdf' 'qt5-base' 'zlib' 'poppler-qt5')
makedepends=('cmake' 'doxygen' 'git')
source=("https://gitlab.com/kebekus/scantools/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7621e22dee47bf22b260b31cd55aa4bad94bcbdd4ac75e0ede5aca5756de5b64')

build() {
  cd ${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
  make -j $(nproc)
}

package() {
	cd ${pkgname}-${pkgver}/build
	make DESTDIR="${pkgdir}/" install
}
