# Maintainer: zoe <chp321@gmail.com>
pkgname=kxstitch
pkgver=2.0.0
pkgrel=2
pkgdesc="The program that lets you create cross stitch patterns and charts."
arch=('i686' 'x86_64')
depends=('plasma-workspace' 'imagemagick')
makedepends=('cmake' 'automoc4' 'doxygen' 'patch' 'extra-cmake-modules' 'kdoctools')
url="https://userbase.kde.org/KXStitch"
license=('GPL')
source=("http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.xz" 
        "${pkgname}.install")
sha1sums=('3c0665ae6431632955aa00f416ebb8a34c7efcc3' '8e58ce0776eff7ef29394a2f7a089191a4af0b1d')
install=${pkgname}.install

build() {
    cd "${srcdir}/kxstitch-${pkgver}"
    #sed -i 's/-DMAGICKCORE_HDRI_ENABLE=0/-DMAGICKCORE_HDRI_ENABLE=1/' CMakeLists.txt
    
    # Avoid bug in cmake :
    #sed -i '5i\cmake_policy(SET CMP0002 OLD)' CMakeLists.txt
   
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
