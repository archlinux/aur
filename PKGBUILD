# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libsbml
_pkgname=libSBML
pkgver=5.18.0
pkgrel=2
pkgdesc="XML-based description language for computational models in systems biology"
url="http://sbml.org/Software/libSBML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libxml2')
optdepends=('bzip2' 'python' 'perl' 'ruby' 'java-runtime') # 'octave' 'mono'
makedepends=('cmake' 'swig' 'python' 'perl' 'ruby' 'java-environment') # 'octave', 'mono'
options=('!libtool')
source=("http://sourceforge.net/projects/sbml/files/libsbml/$pkgver/stable/$_pkgname-$pkgver-core-plus-packages-src.tar.gz")
sha256sums=('6c01be2306ec0c9656b59cb082eb7b90176c39506dd0f912b02e08298a553360')

build() {
  mkdir -p build && cd build
  cmake ../$_pkgname-$pkgver-Source \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DWITH_LIBXML=ON \
    -DWITH_EXPAT=OFF \
    -DWITH_BZIP2=ON \
    -DWITH_ZLIB=ON \
    -DWITH_PYTHON=ON \
    -DENABLE_LAYOUT=ON \
    -DENABLE_RENDER=ON \
    -DENABLE_QUAL=ON \
    -DENABLE_MULTI=ON \
    -DENABLE_COMP=ON \
    -DENABLE_FBC=ON \
    -DENABLE_GROUPS=ON

  make
}

package() {
  cd "$srcdir"/build
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX=/usr -P cmake_install.cmake
}
