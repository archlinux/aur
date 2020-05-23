# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.3

pkgname=fennel
_pkgver='0.4.0'
pkgver=0.4.0
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
sha512sums=('f86da3015680b6a3ea18413480d0c43b37a93e6753dff1fe206a0cf02f5278ab20eca06df32816da6e381a70b28fcc5787a867422d56d4340f2d506a02ff5f71')

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
