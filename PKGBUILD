# Maintainer: Aleksandr Matuzok <sherilynhope@gmail.com>
# Contributors: Patryk Jaworski <regalis@regalis.tech>, John Chen <john.chen@10gen.com>

pkgname=mongo-cxx-driver
pkgver=3.9.0
pkgrel=1
pkgdesc="C++ driver for MongoDB"
arch=('i686' 'x86_64')
url="http://mongocxx.org/"
license=("Apache")
depends=('mongo-c-driver>=1.25.0')
makedepends=(cmake gcc 'mongo-c-driver>=1.25.0' 'boost>=1.56.0')
provides=(libbsoncxx libmongocxx)
conflicts=(libbsoncxx libmongocxx)
source=(https://github.com/mongodb/mongo-cxx-driver/releases/download/r${pkgver}/mongo-cxx-driver-r${pkgver}.tar.gz)
sha256sums=('09526c61b38f6adce86aa9ff682c061d08a5184cfe14e3aea12d8ecaf35364a2')

build() {
    cd "${pkgname}-r$pkgver/build/"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_CXX_STANDARD=17 \
        -DBSONCXX_POLY_USE_BOOST=1 \
        -DENABLE_TESTS=0 \
        ../
    make
}

package() {
	cd "${pkgname}-r$pkgver/build/"
	make DESTDIR="$pkgdir/" install
}
