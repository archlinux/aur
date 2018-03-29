# Maintainer: osch <oliver at luced de>
pkgname=lua-lanes
pkgver=3.11
pkgrel=1
epoch=
pkgdesc="A solution for running Lua multithreaded"
arch=('x86_64')
url="https://github.com/LuaLanes/lanes"
license=('MIT')
groups=()
depends=('lua')
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
md5sums=()
validpgpkeys=()

prepare() {
	cd "lanes-$pkgver"
	#sed -i -e '1s/^/struct s_Universe;\n/' src/tools.h
}

build() {
	cd "lanes-$pkgver"
	make LUA=/usr/bin/lua \
	     LUA_FLAGS=`pkg-config --cflags lua` \
	     LUA_LIBS=`pkg-config --libs lua` \
	     CFLAGS="-O2 -fPIC `pkg-config --cflags lua`"
}

package() {
	cd "lanes-$pkgver"

	install -d                "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`/lanes"
	install src/lanes/core.so "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`/lanes/core.so"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`"
	install -m644 src/lanes.lua "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
}
md5sums=('07ed104a450b76d5919cc8f46a5b4a2f')
