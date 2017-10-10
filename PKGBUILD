# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=dcdfort
pkgver=1.0
pkgrel=1
pkgdesc="Modern Fortran toolkit for reading in and analyzing DCD simulation trajectories from LAMMPS"
arch=(any)
url="https://github.com/wesbarnett/dcdfort"
license=('GPL')
depends=('gcc-fortran')
makedepends=('cmake')
source=(https://github.com/wesbarnett/${pkgname}/releases/download/${pkgver}/${pkgname}.${pkgver}.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('a8f9af46ceb816c2dede0abb0a2789ffb0a01fcad9de885b2754c654f9b1299e3d3d88b9df24eb64c18e6b295c8525edee4d0550b78bd9022b5a71f355f35aa7'
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
