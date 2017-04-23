# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=libgmxfort
pkgver=0.5
pkgrel=1
pkgdesc="A Fortran library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxfort"
license=('GPL')
depends=('xdrfile>=2.1.2' 'gcc-fortran')
makedepends=('cmake')
source=(https://github.com/wesbarnett/${pkgname}/releases/download/${pkgver}/${pkgname}.${pkgver}.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('072e911c634bfffbfc667eba76da2abd3ee6422e0e1d7bf643119d5ec1a6381e3ca015d35a902cd8c01ec225cc4658bb68363de2129625bed1e58b211ae5727c'
            'SKIP')

build() {
    mkdir -p build
    cd build
    cmake "${srcdir}/${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd build
    make test
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
