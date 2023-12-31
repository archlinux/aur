# Maintainer: jlaunay
pkgname=hyprlang-git
pkgver=0.1.0.r3.1210de1
pkgrel=1
pkgdesc="hyprlang - the hypr configuration language"
arch=('any')
url="https://github.com/hyprwm/hyprlang"
license=("GPL")
depends=('bash')
makedepends=('git' 'cmake')
provides=('hyprlang')
source=("git+https://github.com/hyprwm/${pkgname/-git/}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname/-git/}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	# cd "${pkgname/-git/}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S "${pkgname/-git/}" -B build
	cmake --build ./build --config Release --target hyprlang -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)

}

package() {
	# cd "${pkgname/-git/}"
	DESTDIR="$pkgdir" cmake --install build
}
