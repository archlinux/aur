# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.1.6
pkgrel=9
pkgdesc="Kolab XML Format Schema Definitions Library"
url='https://www.kolab.org/'
arch=('x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd' 'swig')
source=("https://mirror.kolabenterprise.com/pub/releases/${pkgname}-${pkgver}.tar.gz"{,.gpg})
sha512sums=('ae74a9276cad2840db09ae9f9178991eb22137a13f83c04dd2fb7513407f2a5e6b7c79d71de80ced786457f1d3c8b5229226aecd8ea139f0af7125268aff4121'
            'defc0ae0261182fc8c535bee0598b9d303c2b1373b005b6e6a214f50135534e15b4f0c132d3d78fe093896494c10a381b0569dee350c7843aa60a9de3af0906f')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
