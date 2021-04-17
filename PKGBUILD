# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=plasma5-applets-qalculate
pkgver=0.8.4
pkgrel=2
pkgdesc="Qalculate! applet for the KDE plasma desktop"
url="https://www.opendesktop.org/p/1155946/"
license=('MIT')
depends=('libqalculate' 'plasma-framework')
makedepends=('cmake' 'extra-cmake-modules')
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dschopf/plasma-applet-qalculate/archive/v$pkgver.tar.gz")
sha256sums=('65ba86cbdae867da7e6ccd0f7872bdff2453dcebe10a38315215bfd6eeb01c5b')

build() {
    mkdir build
    cd build
    cmake "../plasma-applet-qalculate-$pkgver" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    make
}

package() {
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp "plasma-applet-qalculate-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
    cd build
    make DESTDIR="$pkgdir" install
}

