# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=ptr89-git
pkgver=v1.0.2
pkgrel=1
pkgdesc='Yet another binary pattern finder.'
arch=(any)
url='https://github.com/siemens-mobile-hacks/ptr89'
license=(MIT)
depends=()
makedepends=()
source=(git+https://github.com/siemens-mobile-hacks/ptr89)
sha256sums=('SKIP')

prepare() {
	cd "ptr89"
	git submodule init
	git submodule update
}

build() {
	cmake -B build -S ptr89
	cmake --build build
}

package() {
	cd "ptr89"
	make install
}

pkgver() {
	cd "ptr89"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
