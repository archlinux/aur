# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=pllua-ng
pkgver=2.0
pkgrel=1
pkgdesc='PL/Lua is a procedural language module for the PostgreSQL database that allows server-side functions to be written in Lua'
arch=('x86_64')
url='https://pllua.github.io/pllua-ng/'
license=('MIT')
depends=('lua' 'postgresql')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RhodiumToad/pllua-ng/archive/REL_${pkgver/./_}.tar.gz")
md5sums=('f4dc3a643513c59a9830ab1ff2e1f07c')

build() {
	cd "$pkgname-REL_${pkgver/./_}"

	make LUA=lua LUAC=luac LUA_INCDIR=/usr/include LUALIB=-llua
	make -C hstore LUA=lua LUAC=luac LUA_INCDIR=/usr/include LUALIB=-llua
}

package() {
	cd "$pkgname-REL_${pkgver/./_}"

	make DESTDIR="$pkgdir" install
	make -C hstore DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
