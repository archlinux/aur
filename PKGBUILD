# Maintainer: zoe <chp321@gmail.com>
pkgname=symboleditor
pkgver=2.1.0
pkgrel=1
pkgdesc="Symbol editor for KXStitch"
arch=('i686' 'x86_64')
url="https://userbase.kde.org/SymbolEditor"
license=('GPL')
depends=('plasma-workspace' 'imagemagick>=7.0.0')
makedepends=('cmake' 'automoc4' 'doxygen' 'patch')
install=symboleditor.install
        
source=("https://download.kde.org/stable/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "symboleditor.install")
md5sums=('84e6637e6b5095c29ac6378f1075cf93' '5b554364ee8db32e0bb1e881bf0bca34')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    rm -rf build
    mkdir build 
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` .. \
          -DCMAKE_BUILD_TYPE="Release"    
    make
}
 
package() {
    cd "$srcdir/${pkgname}-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}
