# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.3.0
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng")
source=("http://downloads.sourceforge.net/project/nanapro/Nana/Nana 1.x/${pkgname} ${pkgver}.zip"
        fix_cmake_alsa.patch
        fix_memcpy.patch)
sha256sums=('9d3eea56cf330e7064bb193bc53d102f34b14a3a6dc415585f011f6638ec395d'
            'c0fd8c44b51d663e5191dd859e033fbd2ec096df9f0c0b68c868e3a88b14bda4'
            '98c5401396583534682c21b8b2762a1cbbcbecd997804a5b11aabe1094ac4b44')

prepare() {
    cd ${srcdir}/${pkgname}

    patch -Np1 < ../fix_cmake_alsa.patch
    patch -Np1 < ../fix_memcpy.patch
}

build() {
    cd ${srcdir}/${pkgname}

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_JPEG=ON \
        -DENABLE_PNG=ON \
        -DENABLE_MINGW_STD_THREADS_WITH_MEGANZ=ON \
        -DENABLE_AUDIO=ON

    make
}

package() {
    cd ${srcdir}/${pkgname}

    make DESTDIR="${pkgdir}" install
}
