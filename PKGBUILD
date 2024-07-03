# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt5-jpegxl-image-plugin
pkgver=0.6.3
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt5 and KDE based applications to read/write JXL images'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL-3.0-only')
depends=('libjxl' 'qt5-base')
makedepends=('cmake' 'extra-cmake-modules' 'highway')
checkdepends=('appstream')
options=('!emptydirs')
conflicts=('kimageformats')
source=("https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v${pkgver}/qt-jpegxl-image-plugin-${pkgver}.tar.gz")
sha256sums=('56b263b2f16bf85e5cfb4b67f2017c224aba57e6e7aa1b226242097735c2af28')

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
