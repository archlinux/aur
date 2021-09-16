# Maintainer: Aleksandr Matuzok <sherilynhope@gmail.com>
# Contributors: Patryk Jaworski <regalis@regalis.tech>, John Chen <john.chen@10gen.com>

pkgname=mongo-cxx-driver
pkgver=3.5.1
pkgrel=3
pkgdesc="C++ driver for MongoDB"
arch=('i686' 'x86_64')
url="http://mongocxx.org/"
license=("Apache")
depends=(libmongoc libbson)
makedepends=(cmake gcc libmongoc libbson boost)
provides=(libbsoncxx libmongocxx)
conflicts=(libbsoncxx libmongocxx)
source=(https://github.com/mongodb/mongo-cxx-driver/releases/download/r${pkgver}/mongo-cxx-driver-r${pkgver}.tar.gz)
sha256sums=('4092bc5ca41f53aab72c9a5205acd74e1155e49a8c8b3488f546731dff66e5fc')

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
