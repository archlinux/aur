# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=kwin-alt-shift-plugin-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Kwin plugin for switching languages ​​using Alt-Shift (Wayland)'
arch=(any)
url='https://github.com/Azq2/kwin-alt-shift-plugin'
license=(MIT)
depends=()
makedepends=(cmake)
source=(git+https://github.com/Azq2/kwin-alt-shift-plugin)
sha256sums=('SKIP')

prepare() {
	cd "kwin-alt-shift-plugin"
	git submodule init
	git submodule update
}

build() {
	cmake -B build -S kwin-alt-shift-plugin -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
	cd "kwin-alt-shift-plugin"
	git describe --long --tags --abbrev=7 | grep -oP '^v\d+\.\d+\.\d+' | sed 's/^v//g'
}
