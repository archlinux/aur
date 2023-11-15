# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.2.1
pkgrel=4
pkgdesc="Kolab XML Format Schema Definitions Library"
url='https://www.kolab.org/'
arch=('x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'libxsd' 'xsd' 'swig' 'git')
_commit=af7c22e7ad2bf47387d00f030c1da41c292f2bee
source=(git+https://git.kolab.org/diffusion/LKX#commit=$_commit
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
    -DBoost_NO_BOOST_CMAKE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
