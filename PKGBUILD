# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=scantools
pkgver=1.0.7
pkgrel=1
pkgdesc="scantools is a library and a matching set of command line applications for graphics manipulation, written with a view towards the handling of scanned documents and generation of high-quality PDF files."
arch=('x86_64')
url="https://kebekus.gitlab.io/scantools/"
license=('GPL')
depends=('qpdf' 'qt5-imageformats' 'gcc' 'graphviz' 'jbig2dec' 'libjpeg-turbo' 'libtiff' 'openjpeg2' 'tesseract' 'qpdf' 'qt5-base' 'zlib' 'poppler-qt5' 'zopfli')
makedepends=('cmake' 'doxygen' 'git')
optdepends=('jbig2enc-git: Encode PDF files with JBIG2 (recommended)')
source=("https://gitlab.com/kebekus/scantools/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a221ddac4a4b375b530a8480e98206933f668c8d5d1d876886f75fb736c92fe2')

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
