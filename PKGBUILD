# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=dcdfort
pkgver=1.1.1
pkgrel=1
pkgdesc="Modern Fortran toolkit for reading in and analyzing DCD simulation trajectories from LAMMPS"
arch=(any)
url="https://github.com/wesbarnett/dcdfort"
license=('GPL')
depends=('gcc-fortran')
makedepends=('cmake')
source=(https://github.com/wesbarnett/${pkgname}/releases/download/${pkgver}/${pkgname}.${pkgver}.tar.gz{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('650d82558580492c66b95e3adcc3cf0b80d453a13e65dd4dd905acf992541ca58bcee1fa7f535de1998ef1417cf84daf07f51b0eba2a71cb1f77af9326bec524'
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
