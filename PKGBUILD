# Maintainer: zoe <chp321@gmail.com>
# Contributor : enckse <enckse [at] gmail [dot] com>
pkgname=kxstitch
pkgver=2.1.1
pkgrel=2
pkgdesc="The program that lets you create cross stitch patterns and charts."
arch=('i686' 'x86_64')
depends=('plasma-workspace' 'imagemagick')
conflicts=('libmagick6')
makedepends=('cmake' 'automoc4' 'doxygen' 'patch' 'extra-cmake-modules' 'kdoctools')
url="https://userbase.kde.org/KXStitch"
license=('GPL')
source=("https://download.kde.org/stable/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"
       "${pkgname}.install"
       "kxstitch-qt5.11.patch"
       )
sha1sums=('6f712bca3173b90149b67640fb1b63d02725c9ef'
          '8e58ce0776eff7ef29394a2f7a089191a4af0b1d'
          '8c392224f4fa0ce5e036bc59cbe42c407649c663'
          )
install=${pkgname}.install

build() {
    cd "${srcdir}/kxstitch-${pkgver}"
    cp ../kxstitch-qt5.11.patch .
    patch -p1 < kxstitch-qt5.11.patch
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
