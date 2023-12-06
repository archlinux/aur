# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2023.12.04.00
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=('x86_64')
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0'
	'boost-libs' 'fmt' 'openssl' 'zlib' 'bzip2' 'xz' 'lz4' 'zstd' 'libsodium'
	'libdwarf' 'libaio' 'liburing' 'libunwind')
makedepends=('cmake' 'gtest' 'gmock')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('6b13903f058fbb795d3c41124fe9df0da6dc07470348868dedafff3c2b106033')
options=('!lto')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -S . -B _build
	cmake --build _build
}

check() {
	cd "$pkgname-$pkgver"
	# cmake --build _build --target test
}

package() {
	cd "$pkgname-$pkgver"
	cmake --build _build --target install -- DESTDIR="$pkgdir/"
}
