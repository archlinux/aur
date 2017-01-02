# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname="ptypes"
pkgver="2.1.1"
pkgrel="1"
pkgdesc="A simple alternative to the C++ STL that includes multithreading and networking"
arch=('i686' 'x86_64')
url="http://tehsausage.com/ptypes/"
license=('ZLIB')
depends=('gcc-libs-multilib')
# Tests currently fail to compile under gcc
BUILDENV+=('!check')

source=("http://tehsausage.com/ptypes/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
md5sums=('f7ed34b09d5b764294e93382f18a0ed3'
         '3de81702880781bfe6dd6ce7656cae16')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
