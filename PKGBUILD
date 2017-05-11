# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'gperftools' 'boost-libs')
makedepends=('cmake' 'boost')
optdepends=('python2')
replaces=('csympy-git')
conflicts=('csympy-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/sympy/symengine/archive/v$pkgver.tar.gz)
md5sums=('e61d7513cca4963cd062616891de54c6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DWITH_PYTHON:BOOL=ON \
        -DWITH_TCMALLOC:BOOL=ON \
        -DWITH_PTHREAD:BOOL=ON \
        -DWITH_SYMENGINE_THREAD_SAFE:BOOL=ON \
        -DWITH_ARB:BOOL=OFF \
        -DWITH_BOOST:BOOL=ON
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
