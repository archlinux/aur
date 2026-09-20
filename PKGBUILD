# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin
pkgver=0.9.0
pkgrel=1
pkgdesc='Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL-3.0-only')
depends=(
    'glibc'
    'libjxl'
    'libstdc++'
    'qt6-base')
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'vulkan-headers')
checkdepends=(
    'appstream')
source=("https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v${pkgver}/qt-jpegxl-image-plugin-${pkgver}.tar.gz")
sha256sums=('4cf2707ff1ca3deb323a91db2e57a34af42a0a819b58c6669abc0f200e1bdc55')

build() {
    cmake -B build -S "qt-jpegxl-image-plugin-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DKDE_INSTALL_QTPLUGINDIR:PATH='lib/qt6/plugins' \
        -DQT_MAJOR_VERSION:STRING='6' \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
