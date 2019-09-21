# Maintainer: zoe <chp321@gmail.com>
# Contributor : enckse <enckse [at] gmail [dot] com>
pkgname=kxstitch
pkgver=2.2.0
pkgrel=1
pkgdesc="The program that lets you create cross stitch patterns and charts."
arch=('i686' 'x86_64')
depends=('plasma-workspace' 'libmagick')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'kdoctools')
url="https://userbase.kde.org/KXStitch"
license=('GPL')
source=("https://download.kde.org/stable/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"
       "${pkgname}.install")
sha1sums=('d0bb8ea0bfaf9dd3bd4b89fcc8dd238f7bfe5100'
          '8e58ce0776eff7ef29394a2f7a089191a4af0b1d')
install=${pkgname}.install

build() {
    cd "${srcdir}/kxstitch-${pkgver}"
    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` .. \
          -DCMAKE_BUILD_TYPE="Release"
    make
}


package() {
    cd "${srcdir}/kxstitch-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
