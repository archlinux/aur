# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.4

pkgname=fennel
_pkgver=0.7.0
pkgver=0.7.0
pkgrel=1
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
makedepends=('make')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://git.sr.ht/~technomancy/fennel/archive/${_pkgver}.tar.gz")
sha512sums=('d0497291e88337ea02d4716b029e6ebc5252170babd0c14d998a5f45a92d924f2e66e1a185bb5f1e42b32ba7a69cda6c24de7dfe432e03c91a15079da1609f06')

build() {
	cd "$srcdir/fennel-${_pkgver}"
	make fennel fennel.lua fennelview.lua
}

package() {
	cd "$srcdir/fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.lua" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
