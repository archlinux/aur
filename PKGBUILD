# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=pmb887x-emu-git
pkgver=0.0.17
pkgrel=1
pkgdesc='Yet another binary pattern finder.'
arch=(any)
url='https://github.com/siemens-mobile-hacks/pmb887x-emu'
license=(MIT)
depends=()
makedepends=(cmake)
source=(git+https://github.com/siemens-mobile-hacks/pmb887x-emu#branch=next)
sha256sums=('SKIP')

prepare() {
	cd "pmb887x-emu"
	git submodule update --init
}

build() {
	cmake -B build -S pmb887x-emu -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
	cd "pmb887x-emu"
	git describe --long --tags --abbrev=7 | grep -oP '^v\d+\.\d+\.\d+' | sed 's/^v//g'
}
