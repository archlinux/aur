# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.5.2
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xproto")
source=("http://downloads.sourceforge.net/project/nanapro/Nana/Nana 1.x/${pkgname} ${pkgver}.zip"
        add_missing_includes.patch)
sha256sums=('e0a1e0f7f1cf21221a0c55ddfa21e6ac34d7a0bc4c50d93b21e60a2746f07875'
            '13bc32f2432d49f79a0af5c2b2bb26dd1a165e194dd90722715a3650cd022d3a')

prepare() {
    cd ${srcdir}/${pkgname}

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
