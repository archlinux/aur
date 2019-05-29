# Maintainer: Cédric FARINAZZO <cedric.farinazzo@gmail.com>

pkgname=adaptativeneuralnetwork
_fullname=AdaptativeNeuralNetwork
pkgbase=adaptativeneuralnetwork
pkgver=0.1.1.3
pkgrel=0
epoch=
pkgdesc="AdaptativeNeuralNetwork : A static library containing multiple neural network models written in C"
arch=(any)
url="https://gitlab.com/cedricfarinazzo/adaptativeneuralnetwork"
license=('MIT')
depends=('glibc' 'graphviz')
optdepends=()
makedepends=('make' 'cmake' 'gcc')
checkdepends=('criterion')
provides=()
source=("https://github.com/cedricfarinazzo/${_fullname}/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_fullname-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
    make
}

check() {
    cd "$srcdir/$_fullname-$pkgver"
    cd build
    make check
}


package() {
    cd "$srcdir/$_fullname-$pkgver"
    cd build
    make DESTDIR=$pkgdir LIBDIR=$pkgdir/usr/lib install
}
