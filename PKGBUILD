# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-jsonrpc
pkgver=6.7.0
pkgrel=2
pkgdesc='Kurento jsonrpc library'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('boost-libs' 'jsoncpp')
makedepends=('cmake' 'pkg-config' 'jsoncpp' 'boost' 'boost-libs' 'kms-cmake-utils>=6.7.0')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7f2116135369603d831bc6dddbb00b57fddfeeb698c5f69a498a8f5606c400a2')

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
