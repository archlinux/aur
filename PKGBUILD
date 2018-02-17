# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=flatbuffers
pkgver=1.8.0
pkgrel=1
pkgdesc="An efficient cross platform serialization library for C++, with support for Java, C# and Go"
arch=('i686' 'x86_64')
url="http://google.github.io/flatbuffers/"
license=('Apache')
depends=()
makedepends=(cmake)
optdepends=('go' 'java-environment' 'mono')
source=(https://github.com/google/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('c45029c0a0f1a88d416af143e34de96b3091642722aa2d8c090916c6d1498c2e')


build() {
	cd "$srcdir/$pkgname-$pkgver"
    cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=RELEASE
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
