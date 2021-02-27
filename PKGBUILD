# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
pkgname=cffi-lua
pkgver=0.2.1
pkgrel=1
pkgdesc="A portable C FFI for Lua, based on libffi"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://github.com/q66/cffi-lua"
license=('MIT')
depends=("libffi" "lua")
makedepends=("meson" "pkgconf")
source=("https://github.com/q66/$pkgname/archive/v$pkgver.tar.gz"
        )
sha256sums=("c30080d6309167f86d1a96d3ee33f33ef52e884052b7feac140b8c52db10ad7a"
	)

prepare() {
	cd "$pkgname-$pkgver"
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	meson ..
	ninja all
}

check() {
	cd "$pkgname-$pkgver"/build
	ninja test
}

package() {
	cd "$pkgname-$pkgver"/build
	install -Dm644 cffi.so "$pkgdir/usr/lib/lua/5.4/cffi.so"
}
