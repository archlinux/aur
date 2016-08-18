# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.4.0
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xproto")
source=("http://downloads.sourceforge.net/project/nanapro/Nana/Nana 1.x/${pkgname} ${pkgver}.zip"
        fix_memcpy.patch)
sha256sums=('7af5f4922d21ccfa9157a489f7f69594d13d32792300b22141bae0f97ce91ab0'
            '98c5401396583534682c21b8b2762a1cbbcbecd997804a5b11aabe1094ac4b44')

prepare() {
    cd ${srcdir}/${pkgname}

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
