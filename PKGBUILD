# Maintainer: Quentin MICHAUD <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
# Contributor: tee < teeaur at duck dot com >
pkgname=wasmedge
pkgver=0.17.2
pkgrel=1
pkgdesc='A lightweight, high-performance, and extensible WebAssembly runtime'
arch=('x86_64')
url='https://wasmedge.org'
license=('Apache-2.0')
makedepends=('llvm' 'lld' 'cmake' 'ninja' 'spdlog')
depends=('fmt' 'glibc' 'libgcc' 'libstdc++' 'lld' 'llvm-libs' 'spdlog')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WasmEdge/WasmEdge/releases/download/$pkgver/WasmEdge-$pkgver-src.tar.gz"
        'wasmedge-int128-fmt122.patch')
sha256sums=('7f2ef28b45bc136ee1f13a3453caab91d0dd2ba141dce599008486b561a63eac'
            '92f04a5814df581a9886a35a2ce587b64cbc94ec526e52aa79c45b30874b9c06')

prepare() {
	patch -d "$pkgname" -p1 < "$srcdir/wasmedge-int128-fmt122.patch"
}

build() {
	cd "$pkgname"
	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
	ninja -C build
}

package() {
	cd "$pkgname"
	ninja -C build install
}

