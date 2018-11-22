# Maintainer: Victor Tran <vicr12345 at gmail dot com>
# Contributor: Dan Printzell <arch@vild.io>

pkgname=discord-rpc-api
pkgver=3.3.0
pkgrel=3
pkgdesc="Libraries for Discord Rich Presence"
arch=("x86_64")
url="https://github.com/discordapp/discord-rpc"
license=('MIT')
makedepends=('cmake' 'clang')
source=("$pkgname-$pkgver.tar.gz"::'https://github.com/discordapp/discord-rpc/archive/v3.3.0.tar.gz')
md5sums=('6f8c49413a2b91c443d812f4bae39938')
sha256sums=('1c625f3546761e778e084fe037540f4fdb5452e9c297ee790bbb43ce3cf955b5')

build() {
	export CC=clang
	export CXX=clang++
	cd "$srcdir"/discord-rpc-$pkgver
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_EXAMPLES=OFF
	cmake --build . --config Release
}

package() {
	cd "$srcdir"/discord-rpc-$pkgver/build
	cmake --build . --config Release --target install -- DESTDIR=$pkgdir
}
