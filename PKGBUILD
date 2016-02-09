# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <fsmv@sapium.net>
pkgname=libcurlpp
pkgver="0.7.3"
pkgrel=1
pkgdesc="cURLpp is a C++ wrapper for libcURL."
arch=('i686' 'x86_64')
url="http://curlpp.org"
license=('MIT')
depends=('curl>=7.10.0')
makedepends=('boost>=1.33.1')
source=("https://github.com/jpbarrette/curlpp/archive/v${pkgver}.tar.gz"
        "exampleFix.patch")
md5sums=("ee05f248bf3bbf7f381d65cf2d0ee50f"
         "8d53e4c6826e3006d4f127a90dd14051")

prepare() {
	cd "curlpp-$pkgver"
	patch -p0 < ../exampleFix.patch
}

build() {
	cd "curlpp-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make CXXFLAGS='-O2'
}

check() {
	cd "curlpp-$pkgver"
	make -k check
}

package() {
	cd "curlpp-$pkgver"
	make DESTDIR="$pkgdir/" install
}
