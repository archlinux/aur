# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=dyninst
pkgver=10.2.1
pkgrel=1
pkgdesc="Tools for binary instrumentation, analysis, and modification"
arch=('any')
url="https://dyninst.org/"
license=('LGPL')
depends=('libelf' 'tbb' 'boost-libs')
makedepends=('cmake' 'boost')
source=("https://github.com/dyninst/dyninst/archive/v${pkgver}.tar.gz")
sha256sums=('8077c6c7a12577d2ffdcd07521c1eb1b7367da94d9a7ef10bf14053aeaae7ba1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DSTERILE_BUILD=ON \
        -DENABLE_STATIC_LIBS=YES \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
