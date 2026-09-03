# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>

pkgname=plasma6-applets-qalculate
pkgver=0.11.0
pkgrel=1
pkgdesc="Qalculate! applet for the KDE plasma desktop"
url="https://github.com/dschopf/plasma-applet-qalculate"
replaces=('plasma5-applets-qalculate')
license=('MIT')
depends=('libqalculate' 'plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules')
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dschopf/plasma-applet-qalculate/archive/v$pkgver.tar.gz")
sha256sums=('6cfaa10392a506e074ee3b42d29c8482bddff3137205d2faa0848b67f65fd2bf')

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

