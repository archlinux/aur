# Maintainer: marco.rubin@protonmail.com

_name=KDDockWidgets
pkgname=kddockwidgets-qt6
pkgver=2.4.1
pkgrel=1
pkgdesc="KDAB's Dock Widget Framework for Qt 6"
arch=('x86_64')
url="https://github.com/KDAB/KDDockWidgets"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(gcc-libs glibc fmt nlohmann-json qt6-base qt6-declarative spdlog)
makedepends=(cmake qt6-tools)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('5c07dde8c3c561cf4745fdde48de8a8cd72bf5af26f213d4cda189977c5089b5fd30550f6f3ef093875af396e25d14bc1fbacba53ac994a9a74bdbe1e8548bbc')

build() {
    cd $_name-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DKDDockWidgets_FRONTENDS='qtwidgets;qtquick' \
          -DKDDockWidgets_QT6=true \
          .
    cmake --build .
}

package() {
    depends+=(libfmt.so libspdlog.so)

    cd $_name-$pkgver
    DESTDIR="$pkgdir" cmake --install .
}
