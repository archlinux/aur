
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_pkgname=libGoogleDistanceMatrixCpp
pkgname=lib-google-distance-matrix-cpp
pkgver=1.0.1
pkgrel=1
pkgdesc="An object oriented C++ wrapper for The Google Distance Matrix API"
arch=('i686' 'x86_64')
url="https://github.com/arthurzam/${_pkgname}"
license=('LGPL')
depends=('curl' 'jsoncpp')
makedepends=('cmake')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/arthurzam/$_pkgname/archive/v$pkgver.tar.gz")

md5sums=('a1724b69d10afb3ed4474ed2d59f45ba')

prepare()
{
    cd "${srcdir}/$_pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX:PATH=/usr -Wno-dev
}

build()
{
    cd "${srcdir}/$_pkgname-$pkgver/build"
    make -j$(nproc)
}

package()
{
    cd "${srcdir}/$_pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}
