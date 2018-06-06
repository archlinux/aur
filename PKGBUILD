
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=discord-rpc-api-git
pkgver=v3.1.0.r15.g5df1c5a
pkgrel=1
pkgdesc="Libraries for Discord Rich Presence"
arch=("x86_64")
url="https://github.com/discordapp/discord-rpc"
license=('MIT')
makedepends=('git' 'cmake')
conflicts=('discord-rpc-api')
provides=('discord-rpc-api')
source=("$pkgname"::'git+https://github.com/discordapp/discord-rpc.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mkdir -p build
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
	cd "$srcdir/$pkgname/build"
	make install DESTDIR=$pkgdir
	rm $pkgdir/usr/lib64
}
