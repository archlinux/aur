# Maintainer: Jonathan Buchanan <jonathan.russ.buchanan@gmail.com>
pkgname=rhea
pkgver=0.2.4
pkgrel=1
pkgdesc="A constraint solver based on Cassowary"
arch=('i686' 'x86_64')
url="https://github.com/Nocte-/rhea"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake>=2.8.3')
checkdepends=('boost')
source=("https://github.com/Nocte-/$pkgname/archive/$pkgver.tar.gz")
md5sums=('22e97deb84eb5b8e85288974218f9a4a')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir build
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_UNITTESTS=1 ..
	make
}

check() {
	cd "$pkgname-$pkgver/build/unit_tests"
	./unit_tests
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
