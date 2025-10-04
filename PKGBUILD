# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt5-jpegxl-image-plugin
pkgver=0.8.1
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt5 and KDE based applications to read/write JXL images'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'libjxl'
    'qt5-base')
makedepends=(
    'cmake'
    'extra-cmake-modules')
checkdepends=(
    'appstream')
source=("https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v${pkgver}/qt-jpegxl-image-plugin-${pkgver}.tar.gz")
sha256sums=('af0860f9f50b8c90b686e5417c1d99d09930092fb936eda65ffe1f63e9899b48')

build() {
    cmake -B build -S "qt-jpegxl-image-plugin-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DQT_MAJOR_VERSION:STRING='5' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
