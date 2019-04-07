# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=plasma5-applets-qalculate
pkgver=0.6
pkgrel=1
pkgdesc="Qalculate! applet for the KDE plasma desktop"
url="https://www.opendesktop.org/p/1155946/"
license=('MIT')
depends=('qt5-declarative' 'libqalculate')
makedepends=('cmake' 'extra-cmake-modules')
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dschopf/qalculate/archive/v0.6.tar.gz"
        'https://raw.githubusercontent.com/dschopf/qalculate/master/COPYING')
sha256sums=('ed3c1b87f21c208804dfd92ede1bc469c732151976b0886f693c2570056239b8' 'SKIP')

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

