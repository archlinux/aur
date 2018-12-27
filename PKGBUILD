# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=plasma5-applets-qalculate
pkgver=0.5
pkgrel=1
pkgdesc="Qalculate! applet for the KDE plasma desktop"
url="https://www.opendesktop.org/p/1155946/"
license=('MIT')
depends=('qt5-declarative' 'libqalculate')
makedepends=('cmake' 'extra-cmake-modules')
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dschopf/qalculate/archive/v0.5.tar.gz"
        'https://raw.githubusercontent.com/dschopf/qalculate/master/COPYING')
sha256sums=('c6357abd18ca667165231cc98722e2ff6a34bdc0d7783ac4607d93322b736f99' 'SKIP')

build() {
    mkdir build
    cd build
    cmake ../qalculate-$pkgver \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    make
}

package() {
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"
    cd build
    make DESTDIR="$pkgdir" install
}

