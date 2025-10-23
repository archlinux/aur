# Maintainer: marco.rubin@protonmail.com

_name=KDDockWidgets
pkgname=kddockwidgets-qt6
pkgver=2.3.0
pkgrel=4
pkgdesc="KDAB's Dock Widget Framework for Qt 6"
arch=('x86_64')
url="https://github.com/KDAB/KDDockWidgets"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(gcc-libs glibc fmt nlohmann-json qt6-base qt6-declarative spdlog)
makedepends=(cmake qt6-tools)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('ae89557839afd7c7557e4268175f43b58724c4f275aefdcdd6d329128bdecb12cf17af465749354055e11718511164252da15cf1f52b53d50be069de84ef2142')

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
