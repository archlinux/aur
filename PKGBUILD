# Maintainer: Aleksandr Matuzok <sherilynhope@gmail.com>
# Contributor: Patryk Jaworski <regalis@regalis.tech>

pkgname=mongo-cxx-driver
pkgver=3.4.0
pkgrel=3
pkgdesc="C++ driver for MongoDB"
arch=('i686' 'x86_64')
url="http://mongocxx.org/"
license=("Apache")
depends=(libmongoc libbson)
makedepends=(cmake gcc libmongoc libbson boost)
provides=(libbsoncxx libmongocxx)
conflicts=(libbsoncxx libmongocxx)
source=(https://github.com/mongodb/mongo-cxx-driver/archive/r${pkgver}.tar.gz)
sha256sums=('e9772ac5cf1c996c2f77fd78e25aaf74a2abf5f3864cb31b18d64955fd41c14d')

build() {
	cd "${pkgname}-r$pkgver/build/"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_CXX_STANDARD=17 \
        -DBSONCXX_POLY_USE_BOOST=1 \
        ../
	make
}

package() {
	cd "${pkgname}-r$pkgver/build/"
	make DESTDIR="$pkgdir/" install
}