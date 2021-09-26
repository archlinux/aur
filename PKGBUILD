# Maintainer: Noa (coolreader18)
pkgname=wasm3-git
pkgver=v0.5.0.r10.8850f91
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
	cd "$srcdir/wasm3"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/wasm3"
	mkdir -p build
	cd build
	CFLAGS=-ffile-prefix-map=$srcdir/wasm3/='' cmake ..
	make
}

package() {
	cd "$srcdir/wasm3"
	install -D ./build/wasm3 -t "$pkgdir"/usr/bin
}
