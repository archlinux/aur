# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.5.1
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xproto")
source=("http://downloads.sourceforge.net/project/nanapro/Nana/Nana 1.x/${pkgname} ${pkgver}.zip"
        fix_memcpy.patch
        add_missing_includes.patch)
sha256sums=('7a0afd92060d7c2c40a594b9649aa408b2ad42795c7e27a2d3ddd95aeb8ab415'
            '98c5401396583534682c21b8b2762a1cbbcbecd997804a5b11aabe1094ac4b44'
            'ec0896c20b111b4c5c4d51b90399716d79d0239e34a45029d687419a8e73e19a')

prepare() {
    cd ${srcdir}/${pkgname}

    patch -Np1 < ../fix_memcpy.patch
    patch -Np1 < ../add_missing_includes.patch
}

build() {
    cd ${srcdir}/${pkgname}

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=YES

    make
}

package() {
    cd ${srcdir}/${pkgname}

    make DESTDIR="${pkgdir}" install
}
