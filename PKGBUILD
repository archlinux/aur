# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libclsp
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="A C++17 library for language servers"
arch=('x86_64')
url="https://github.com/otreblan/libclsp"
license=('GPL3')
groups=()
depends=('boost-libs')
makedepends=('cmake' 'boost' 'rapidjson')
checkdepends=()
optdepends=()
provides=("${pkgname}.so")
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("8e835d60a8e3fa38906d3bbc7c99a161a52bbf2fdb6df0b15473e7b54edb41f9")

prepare() {
	mkdir -p "$pkgname-$pkgver/build"
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
