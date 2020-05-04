# Maintainer: Aleksandr Matuzok <sherilynhope@gmail.com>
# Contributors: Patryk Jaworski <regalis@regalis.tech>, John Chen <john.chen@10gen.com>

pkgname=mongo-cxx-driver
pkgver=3.5.0
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
sha256sums=('046395b5b03c7b3298adc9cfe2c3e4dd97784d6eaa58b83193d150f05a6b6b82')

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
