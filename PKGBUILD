# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.3.1
pkgrel=6
pkgdesc='Kolab XML Format Schema Definitions Library'
url='https://www.kolab.org/'
arch=('x86_64')
license=(LGPL-3.0-or-later)
depends=(boost-libs
         curl
         glibc
         gcc-libs
         xerces-c)
makedepends=(boost
             cmake
             git
             libxsd
             xsd)
source=(git+https://git.kolab.org/diffusion/LKX#tag=libkolabxml-$pkgver
        xsd-4.2.patch)
sha512sums=('SKIP'
            'a7febec03ccaa99f22e10fad604c66c12d35dd91f2a01287f4c96a2037237d86ee4f918aaa5b2857fce6fdf5482f7ad6bf36bec9c96473c4a711c7605448d868')

prepare() {
  patch -d LKX -p1 < xsd-4.2.patch # Fix build with XSD 4.2
}

build() {
  cmake -B build -S LKX \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
