# Maintainer: Hoang Nguyen <toi at doclai dot com>
# Contributor: gesh <gesh@gesh.uni.cx>

_pkgname=nchat
pkgname="${_pkgname}"
pkgver=4.41
pkgrel=1
pkgdesc="console-based chat client with support for Telegram"
arch=('x86_64')
depends=(
    'file'
    'ncurses'
    'openssl'
    'sqlite'
    'zlib'
)
makedepends=(
    'cmake'
    'go'
    'gperf'
)

conflicts=("${_pkgname}-git")

_pkgsrc="$_pkgname-$pkgver"
url="https://github.com/d99kris/nchat"
license=('MIT')
source=("$_pkgsrc.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('368cfe30594b88c580d9e9ccf24a0ff4eda7e6fea3d5a2e0f4051eab81fbf9ca')

build() {
	local _cmake_options=(
			-B build
			-S "$_pkgsrc"
			-G 'Unix Makefiles'
			-DCMAKE_BUILD_TYPE=None
			-DCMAKE_INSTALL_PREFIX='/usr'
			-DCMAKE_INSTALL_MANDIR='/usr/share/man'
			-Wno-dev
			)
	
	cmake "${_cmake_options[@]}"
	cmake --build build
}
package() {
	DESTDIR="$pkgdir" cmake --install build
	install -D -m644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
