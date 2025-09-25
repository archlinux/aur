pkgbase=qt-heic-image-plugin
pkgname=(qt5-heic-image-plugin qt6-heic-image-plugin)
pkgver=0.6.2
pkgrel=1
pkgdesc="Qt plug-in to allow Qt and KDE based applications to read/write HEIF/HEIC images."
arch=("x86_64")
url="https://github.com/novomesk/qt-heic-image-plugin"
license=("LGPL-2.1-only")
depends=(libheif)
makedepends=(cmake extra-cmake-modules qt5-base qt6-base)
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43805c79cf10d8bdfff7586ac8dabdc5a606ece7592cd3a052df7212486a4d96')


build() {
    msg2 "Building QT5 version..."
    cmake -B build-qt5 -S qt-heic-image-plugin-$pkgver \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=None \
        -DQT_MAJOR_VERSION=5
    cmake --build build-qt5

    msg2 "Building QT6 version..."
    cmake -B build-qt6 -S qt-heic-image-plugin-$pkgver \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=None \
        -DQT_MAJOR_VERSION=6
    cmake --build build-qt6
}

package_qt5-heic-image-plugin() {
    depends+=(qt5-base)
    pkgdesc+=" (QT5 version)"
    DESTDIR="$pkgdir" cmake --install build-qt5
}

package_qt6-heic-image-plugin() {
    depends+=(qt6-base)
    pkgdesc+=" (QT6 version)"
    DESTDIR="$pkgdir" cmake --install build-qt6
}
