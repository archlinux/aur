# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin
pkgver=0.6.2
pkgrel=1
pkgdesc='Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL-3.0-only')
depends=('libjxl' 'qt6-base')
makedepends=('cmake' 'extra-cmake-modules' 'highway' 'vulkan-headers')
checkdepends=('appstream')
options=('!emptydirs')
source=("https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v${pkgver}/qt-jpegxl-image-plugin-${pkgver}.tar.gz")
sha256sums=('c3292b5884c6cbdb432245a23068be6dd4bb85a8cbae5a470f612457c3610f40')

build() {
    cmake -B build -S "qt-jpegxl-image-plugin-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DKDE_INSTALL_QTPLUGINDIR:PATH='lib/qt6/plugins' \
        -DQT_MAJOR_VERSION:STRING='6' \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
