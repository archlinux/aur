
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=discord-rpc-api
pkgver=1.0
pkgrel=0
pkgdesc="Libraries for Discord Rich Presence"
arch=("x86_64")
url="https://github.com/discordapp/discord-rpc"
license=('MIT')
depends=('')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/discordapp/discord-rpc.git')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON
	cmake --build .
}

package() {
	cd $pkgdir
	mkdir usr
	cd usr
	mkdir lib
	ln -s ./lib lib64
	cd "$srcdir/$pkgname-$pkgver/build"
	make install DESTDIR=$pkgdir
	rm $pkgdir/usr/lib64
}
