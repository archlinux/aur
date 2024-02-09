# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt5-jpegxl-image-plugin
pkgver=0.6.0
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt5 and KDE based applications to read/write JXL images'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL3')
depends=('libjxl' 'qt5-base')
makedepends=('cmake' 'extra-cmake-modules' 'highway')
checkdepends=('appstream')
options=('!emptydirs')
conflicts=('kimageformats')
source=("https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v${pkgver}/qt-jpegxl-image-plugin-${pkgver}.tar.gz")
sha256sums=('6c8cd05cd9e7567734a28ffded2791421e8f377bfc6cf92430c253aa0bb80224')

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
