# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=ptr89-git
pkgver=1.0.4
pkgrel=1
pkgdesc='Yet another binary pattern finder.'
arch=(any)
url='https://github.com/siemens-mobile-hacks/ptr89'
license=(MIT)
depends=()
makedepends=(cmake)
source=(git+https://github.com/siemens-mobile-hacks/ptr89)
sha256sums=('SKIP')

prepare() {
	cd "ptr89"
	git submodule init
	git submodule update
}

build() {
	cmake -B build -S ptr89 -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
	cd "ptr89"
	git describe --long --tags --abbrev=7 | grep -oP '^v\d+\.\d+\.\d+' | sed 's/^v//g'
}
