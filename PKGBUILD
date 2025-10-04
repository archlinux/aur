# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=libcurlpp-git
pkgver=r304.d080e30
pkgrel=1
pkgdesc="cURLpp is a C++ wrapper for libcURL (git version)"
arch=('i686' 'x86_64' 'aarch64')
url="http://curlpp.org"
license=('MIT')
depends=('curl>=7.10.0')
makedepends=('cmake>=2.8.12')
source=($pkgname'::git+https://github.com/jpbarrette/curlpp.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build
	#  -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations" -Wno-dev
	cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' ..
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
