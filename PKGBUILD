# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=poac
pkgver=0.2.1
pkgrel=1
pkgdesc="Package manager for C++ like Cargo for Rust"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://poac.pm"
license=('GPL3')
depends=('git' 'tar' 'graphviz' 'yaml-cpp')
makedepends=('cmake' 'boost')
optdepends=('cmake: To build CMake projects'
'make: To build projects with Makefile')
provides=('poac-devel-git' 'poac-git')
conflicts=('poac-devel-git' 'poac-git')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/poacpm/poac/archive/"$pkgver".tar.gz)
md5sums=('006f44f56ae5f624a50b7b0bc3d6f195')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build
	cd build

	cmake -E env CXXFLAGS=-O3 cmake .. -DBoost_USE_STATIC_LIBS=ON \
	-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
