# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=elf2vkp-git
pkgver=1.1.5
pkgrel=1
pkgdesc='Tool for converting .elf to .vkp patches.'
arch=(any)
url='https://github.com/siemens-mobile-hacks/elf2vkp'
license=(MIT)
depends=()
makedepends=(cmake)
source=(git+https://github.com/siemens-mobile-hacks/elf2vkp)
sha256sums=('SKIP')

prepare() {
	cd "elf2vkp"
	git submodule init
	git submodule update
}

build() {
	cmake -B build -S elf2vkp -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
	cd "elf2vkp"
	git describe --long --tags --abbrev=7 | grep -oP '^v\d+\.\d+\.\d+' | sed 's/^v//g'
}
