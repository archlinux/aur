# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'arb' 'gperftools' 'boost-libs')
makedepends=('cmake' 'git' 'boost')
optdepends=('python2')
replaces=('csympy-git')
conflicts=('csympy-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/sympy/symengine/archive/v$pkgver.tar.gz)
md5sums=('45401561add36a13c1f0b0c5f8d7422d')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DWITH_PYTHON:BOOL=ON \
        -DWITH_TCMALLOC:BOOL=ON \
        -DWITH_PTHREAD:BOOL=ON \
        -DWITH_SYMENGINE_THREAD_SAFE:BOOL=ON \
        -DWITH_ARB:BOOL=ON \
        -DWITH_BOOST:BOOL=ON
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
