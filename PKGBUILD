# Maintainer: marco.rubin@protonmail.com

_name=KDDockWidgets
pkgname=kddockwidgets-qt6
pkgver=2.4.0
pkgrel=1
pkgdesc="KDAB's Dock Widget Framework for Qt 6"
arch=('x86_64')
url="https://github.com/KDAB/KDDockWidgets"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(gcc-libs glibc fmt nlohmann-json qt6-base qt6-declarative spdlog)
makedepends=(cmake qt6-tools)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('aaf800d7359b350d69a9b72e513cb06fe32d8a7791519267e1102732294bbc679dd9ad0ea32c229133d66833f8dd9ed63d7dc58c92dededfb3fddc93e4c9fb56')

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
