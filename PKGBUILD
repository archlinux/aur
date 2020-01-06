# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=plasma5-applets-qalculate
pkgver=0.8
pkgrel=1
pkgdesc="Qalculate! applet for the KDE plasma desktop"
url="https://www.opendesktop.org/p/1155946/"
license=('MIT')
depends=('qt5-declarative' 'libqalculate')
makedepends=('cmake' 'extra-cmake-modules')
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dschopf/plasma-applet-qalculate/archive/v0.8.tar.gz")
sha256sums=('2f1a0689f611443fea89006b66e97dbc4e4e9800c7da1287ce1e6a504bcd7284')

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

