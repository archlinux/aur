# Maintainer: condy chen <condy0919@gmail.com>
pkgname=crow-git
pkgver=r237.da4bb3a
pkgrel=1
pkgdesc='Crow is very fast and easy to use C++ micro web framework (inspired by Python Flask)'
arch=('any')
url="https://github.com/ipkn/crow"
license=('GPL')
depends=('boost')
makedepends=('git' 'cmake' 'make' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
optoptions=('gperftools: Fast, multi-threaded malloc and nifty performance analysis tools')
source=("${pkgname}"::'git+https://github.com/ipkn/crow.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
    mkdir build -p
    cd build
    cmake ..
	make
}

package() {
	cd "$srcdir/${pkgname}"
    install -Dm644 "build/amalgamate/crow_all.h" "$pkgdir/usr/include/crow.h"
}
