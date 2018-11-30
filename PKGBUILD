# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libsbml
_pkgname=libSBML
pkgver=5.17.0
pkgrel=1
pkgdesc="XML-based description language for computational models in systems biology"
url="http://sbml.org/Software/libSBML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libxml2')
optdepends=('bzip2' 'python2' 'perl' 'ruby' 'java-runtime') # 'octave' 'mono'
makedepends=('cmake' 'swig' 'python2' 'perl' 'ruby' 'java-environment') # 'octave', 'mono'
options=('!libtool')
source=("http://sourceforge.net/projects/sbml/files/libsbml/$pkgver/stable/$_pkgname-$pkgver-core-plus-packages-src.tar.gz")
md5sums=('a17bcb9b02165d6c2611063cbad7a32f')

build() {
  mkdir -p build && cd build
  cmake ../$_pkgname-$pkgver-Source \
    -DWITH_LIBXML=ON \
    -DWITH_EXPAT=OFF \
    -DWITH_BZIP2=ON \
    -DWITH_ZLIB=ON \
    -DWITH_PYTHON=ON \
    -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
    -DENABLE_LAYOUT=ON \
    -DENABLE_RENDER=ON \
    -DENABLE_QUAL=ON \
    -DENABLE_MULTI=ON \
    -DENABLE_COMP=ON \
    -DENABLE_FBC=ON \
    -DENABLE_SPATIAL=ON \
    -DENABLE_GROUPS=ON

  make
}

package() {
  cd "$srcdir"/build
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX=/usr -P cmake_install.cmake
}
