# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.3

pkgname=fennel
_pkgver='0.4.1'
pkgver=0.4.1
pkgrel=1
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
makedepends=('make')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://github.com/bakpakin/Fennel/archive/${_pkgver}.tar.gz")
sha512sums=('cd20e110173c1a548685e06cc8d6073eab7ddfa14fe34df31a9e99f7581f8dc318d809cb0973323684515a25f3e66f26e88e52ea0968213f32c07f372348fe00')

build() {
	cd "$srcdir/Fennel-${_pkgver}"
	make fennel fennel.lua fennelview.lua fennelfriend.lua
}

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.lua" "fennelfriend.lua" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
