# Maintainer: Noah (coolreader18)
pkgname=wasm3-git
pkgver=v0.4.9.r212.4f0b769
pkgrel=1
pkgdesc="A high performance WebAssembly interpreter written in C"
arch=(x86_64 i686)
url="https://github.com/wasm3/wasm3"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('wasm3::git+https://github.com/wasm3/wasm3')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir"/usr/bin
	install ./build/wasm3 "$pkgdir"/usr/bin
}
