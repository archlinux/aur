# Maintainer: osch <oliver at luced de>
pkgname=lua51-lanes
pkgver=3.16.0
pkgrel=1
epoch=
pkgdesc="A solution for running Lua multithreaded"
arch=('x86_64')
url="https://github.com/LuaLanes/lanes"
license=('MIT')
groups=()
depends=('lua51')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/LuaLanes/lanes/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('e2269b56449ac1b7d8973ed1f40871b7')
validpgpkeys=()

prepare() {
	cd "lanes-$pkgver"
}

build() {
	cd "lanes-$pkgver"
	make LUA=/usr/bin/lua51 \
	     LUA_FLAGS=`pkg-config --cflags lua51` \
	     LUA_LIBS=`pkg-config --libs lua51` \
	     CFLAGS="-O2 -fPIC `pkg-config --cflags lua51`"
}

package() {
	cd "lanes-$pkgver"

	install -d                "$pkgdir`pkg-config --variable=INSTALL_CMOD lua51`/lanes"
	install src/lanes/core.so "$pkgdir`pkg-config --variable=INSTALL_CMOD lua51`/lanes/core.so"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_LMOD lua51`"
	install -m644 src/lanes.lua "$pkgdir`pkg-config --variable=INSTALL_LMOD lua51`"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_INC lua51`"
	install -m644 src/lanes.h   "$pkgdir`pkg-config --variable=INSTALL_INC lua51`"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
}
