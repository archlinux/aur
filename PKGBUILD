# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin
pkgver=0.2.0
pkgrel=1
pkgdesc='Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL3')
depends=('libjxl' 'qt6-base')
makedepends=('cmake' 'extra-cmake-modules' 'highway' 'vulkan-headers')
checkdepends=('appstream')
source=("https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v${pkgver}/qt-jpegxl-image-plugin-${pkgver}.tar.gz"
        '010-qt-jpegxl-image-plugin-add-qt6-support.patch')
sha256sums=('90c8c5b0afb709d4a71f536b3c1eb04d4f26a186220b2cae1b396c42ffbe299c'
            '2058af22093781d6d675372fc177090416f667235d49342657c14b403f66271d')

prepare() {
    patch -d "qt-jpegxl-image-plugin-${pkgver}" -Np1 -i "${srcdir}/010-qt-jpegxl-image-plugin-add-qt6-support.patch"
}

build() {
    cmake -B build -S "qt-jpegxl-image-plugin-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DQT_MAJOR:STRING='6' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
