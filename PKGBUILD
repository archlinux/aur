# Maintainer: osch <oliver at luced de>
pkgname=lua52-lanes
pkgver=3.16.0
pkgrel=1
epoch=
pkgdesc="A solution for running Lua multithreaded"
arch=('x86_64')
url="https://github.com/LuaLanes/lanes"
license=('MIT')
groups=()
depends=('lua52')
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
	make LUA=/usr/bin/lua52 \
	     LUA_FLAGS=`pkg-config --cflags lua52` \
	     LUA_LIBS=`pkg-config --libs lua52` \
	     CFLAGS="-O2 -fPIC `pkg-config --cflags lua52`"
}

package() {
	cd "lanes-$pkgver"

	install -d                "$pkgdir`pkg-config --variable=INSTALL_CMOD lua52`/lanes"
	install src/lanes/core.so "$pkgdir`pkg-config --variable=INSTALL_CMOD lua52`/lanes/core.so"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_LMOD lua52`"
	install -m644 src/lanes.lua "$pkgdir`pkg-config --variable=INSTALL_LMOD lua52`"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_INC lua52`"
	install -m644 src/lanes.h   "$pkgdir`pkg-config --variable=INSTALL_INC lua52`"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
}
