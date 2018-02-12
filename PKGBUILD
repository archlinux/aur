# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-jsonrpc
pkgver=1.1.3
pkgrel=1
pkgdesc='Kurento jsonrpc library'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('boost-libs' 'jsoncpp')
makedepends=('cmake' 'pkg-config' 'jsoncpp' 'boost' 'boost-libs' 'kms-cmake-utils>=1.3.2')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('62bde88410a5e4ac31732fb4fa2b2c5a04352d726c5cb636d1fd809eeb4032fe')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

    find . -type f -exec sed -i -E "s/kmsjsoncpp/jsoncpp/g" {} \;
}
build() {
    mkdir -p "build"
    cd "build"

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations"
}
package() {
    make -C build DESTDIR="${pkgdir}" install
}
