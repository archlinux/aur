# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.4

pkgname=fennel
_pkgver=0.5.0
pkgver=0.5.0
pkgrel=2
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
makedepends=('make')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://git.sr.ht/~technomancy/fennel/archive/${_pkgver}.tar.gz")
sha512sums=('9ed233c78debb0e7792679b6e0d36c1b73837316e19461ce21f8c0d68141cab45b100ddc29ced738a76f70f93d95f6a0a04a82d32ca39b6ce7e293605f3a9967')

build() {
	cd "$srcdir/Fennel-${_pkgver}"
	make fennel fennel.lua fennelview.lua
}

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.lua" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
