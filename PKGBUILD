# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libtree
pkgver=1.0.3
pkgrel=1
pkgdesc="ldd as a tree with an option to bundle dependencies into a single folder "
arch=('x86_64')
url="https://github.com/haampie/libtree"
license=('MIT')
depends=('cppglob' 'binutils' 'chrpath')
makedepends=('cmake' 'cxxopts' 'termcolor' 'elfio')
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f5f90118b7e3608980bca81228064344ace3d8d1f8f7c94c9384ec5f59180f09')

prepare() {
	mkdir -p "$pkgname-$pkgver/build"
}

build() {
	cd "$pkgname-$pkgver/build" || exit 1

	cmake \
		-DUSE_SYSTEM_DEPS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build" || exit 1

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
