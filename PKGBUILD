# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt5-jpegxl-image-plugin
pkgver=0.4.1
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
sha256sums=('0ec1fbb5bf1a1b465acb0508576cf01998c03f7138bf89dd4b31cecfb1141155')

build() {
    cmake -B build -S "qt-jpegxl-image-plugin-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DQT_MAJOR_VERSION:STRING='5' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
