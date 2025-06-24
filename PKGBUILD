# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=libffshit-git
pkgver=0.0.1
pkgrel=4
pkgdesc='Siemens filesystem library.'
arch=(any)
url='https://github.com/siemens-mobile-hacks/libffshit'
license=(MIT)
depends=(spdlog fmt)
makedepends=(cmake)
source=(git+https://github.com/siemens-mobile-hacks/libffshit)
sha256sums=('SKIP')

prepare() {
	cd "libffshit"
	git submodule init
	git submodule update
}

build() {
	cmake -B build -S libffshit -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build --prefix /usr
}

pkgver() {
	cd "libffshit"
	cat CMakeLists.txt | grep 'project(' -i | grep -P 'VERSION[ ]*[.0-9]*' -o | head -n1 | awk '{ print $2 }'
}
