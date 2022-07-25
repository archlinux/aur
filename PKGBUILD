# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vinecopulib
pkgver=0.6.1
pkgrel=1
pkgdesc="C++ vine copula library"
license=('MIT')
arch=('x86_64')
url="https://github.com/vinecopulib/vinecopulib"
depends=('gcc-libs')
makedepends=('cmake' 'eigen' 'boost' 'libwdm')
provides=('libvinecopulib.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a1201009882f723228f805b84e7b8de858727c1c14817379c021e03e49550e56')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DVINECOPULIB_SHARED_LIB=ON \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
